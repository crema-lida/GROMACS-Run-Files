set -e

packmol < conf.inp  # 构建初始结构
gmx editconf -f conf.pdb -o conf -box 8 8 18  # 构建模拟盒子
# 能量最小化
gmx grompp -f min -o min -c conf
gmx mdrun -deffnm min
# 在 NPT 系综下从 0 K 升温至 323.15 K，模拟 300 ps
gmx grompp -f npt -o npt -c min
gmx mdrun -deffnm npt
# 继续模拟 30 ns
gmx grompp -f npt2 -o npt -c npt -t npt.cpt
gmx mdrun -deffnm npt -cpi npt.cpt
# 在 VMD 中查看
vmd npt.gro
