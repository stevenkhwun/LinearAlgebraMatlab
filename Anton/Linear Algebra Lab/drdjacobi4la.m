function [xnew xbig] = drsjacobi4la(a,b,x0,tol)
%
% run jacobi to tolerance tol, for given a

verybig = 1.0e3;
nj=diag(diag(a));
pj=nj-a;
mj=nj\pj;
bj=nj\b;
disp('The Jacobi Iteration Method for')
disp('A =');disp(a)
disp('B =');disp(b)
disp('D =');disp(nj)
disp('P = ');disp(pj)
disp('Mj = Dinv*P =');disp(mj)
disp('norm of Mj = ');disp(norm(mj))
disp('invD*B =');disp(bj)
xold=x0;
xbig = xold;
xnew = mj*xold+bj;
count = 1;
xbig = [xbig xnew];
err = norm(xold-xnew);
while err > tol
    xold = xnew;
    xnew = mj*xold + bj;
    xbig = [xbig xnew];
    err = norm(xold-xnew);
    count = count + 1;
    if count > 50
        disp('large number of iterations, n = ')
        disp(count)
        return
    end
    if err > verybig
        disp('the method seems to be diverging, latest error > verybig, err =')
        disp(err)
        return
    end
end
disp('error tolerance met, with latest err =')
disp(err)
return