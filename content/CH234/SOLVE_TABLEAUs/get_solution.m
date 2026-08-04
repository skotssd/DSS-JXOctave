% ----------- for solving tableau ----------------

function [xans,maxerror]=get_solution(TABLEAU,Xguess)
    % now take TABLEAU apart -----------------------------------------

    [N,M]=size(TABLEAU);

    ASOLUTION=TABLEAU(1:N-1,1:M-1);
    KSOLUTION=TABLEAU(1:N-1,M);
    T=TABLEAU(N,1:M-1)'; T(T==0)=1e-30;

    % initial guess

    X=Xguess; 

    % solve it

    [xans,masserr,J,C] = nl_massbalancerrnosolid_NR(X,ASOLUTION,KSOLUTION,T);

    % outputs

    maxerror=max(abs(masserr));
    xans=xans;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%