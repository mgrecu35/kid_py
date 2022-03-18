varList=['z(nz)','x(0:nx+1)','exner(nz, 0:nx+1)',
         'w(nz, 0:nx+1)',
         'v(nz, 0:nx+1)',
         'rho(nz)',
         'theta(nz, 0:nx+1)',
         'qv(nz, 0:nx+1)']

l1='subroutine getvars('
for v1 in varList:
    ind=v1.find("(")
    var_string=v1[:ind]+'_o'
    l1+="%s,"%var_string

codeL=[]
codeL.append(l1+"&\n")
codeL.append("nx_o,nz_o)\n")
codeL.append("use column_variables\n")
codeL.append("implicit none\n")
codeL.append("integer :: nx_o,nz_o\n")
for v1 in varList:
    l1="real, intent(out) :: %s\n"%v1
    l1=l1.replace("(","_o(")
    l1=l1.replace("tent_o","tent")
    l1=l1.replace("nx","nx_o")
    l1=l1.replace("nz","nz_o")
    codeL.append(l1)

for v1 in varList:
    ind=v1.find("(")
    v1=v1[:ind]
    l1="%s_o=%s\n"%(v1,v1)
    codeL.append(l1)

codeL.append("end subroutine getvars\n")
out=open("../getVars.f90","w")
for codel in codeL:
    out.write(codel)
out.close()
