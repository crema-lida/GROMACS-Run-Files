set -e

packmol < conf.inp  # 构建初始结构
gmx editconf -f conf.pdb -o conf -box 8  # 构建模拟盒子
# 能量最小化
gmx grompp -f min -o min -c conf -maxwarn 1
gmx mdrun -deffnm min
# 在真空中进行模拟 500 ps
gmx grompp -f nvt -o nvt -c min -maxwarn 1
gmx mdrun -deffnm nvt
# 继续模拟 20 ns
gmx grompp -f nvt2 -o nvt -c nvt -t nvt.cpt -maxwarn 1
gmx mdrun -deffnm nvt -cpi nvt.cpt
# 修改轨迹文件，选择残基 XHXW（对应聚乙二醇链）居中
echo -e "XHXW\n0" | gmx trjconv -f nvt -o processed -pbc mol -s nvt -center
# 在 VMD 中查看
vmd nvt.gro
