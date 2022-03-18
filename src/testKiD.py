import kidpy as t
import os
os.chdir("../")
t.initkid()
nx_py=t.pykid.nx_py
nz_py=t.pykid.nz_py
z_py,x_py,exner_py,w_py,v_py,\
    rho_py,theta_py,qv_py=t.getvars(nx_py,nz_py)

for i in range(3600):
    t.pyloop()
