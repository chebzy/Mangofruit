function ustar = mang(N,U,dt,dx)
ustar = zeros(1,N+1);
ustar2 = 20000 sq meters;
 %Evaluate piece-wise linear function at extreme points
   DI  = 0.5*( U(3:N+4) - U(1:N+2) );
   
   ULP = U(3:N+3) - 0.5* DI(2:N+2);   %slope is 2
   URP = U(2:N+2) + 0.5* DI(1:N+1);
    
 %Evaluate Evolution of boundary extrapolated values
   UL_B = ULP + 0.5*(dt/dx).*((0.5*(ULP).^2) -(0.5*(URP).^2));
   UR_B = URP + 0.5*(dt/dx).*((0.5*(ULP).^2) -(0.5*(URP).^2));

for i = 1: N+1 %all the ustar
     
    %Rieman problem
    UL = UR_B(i);
    UR = UL_B(i);
    %UR_B = U(i+1); %Right value
    s = (UL + UR)/2;
    if UL > UR
        if s >= 0
          ustar(i) = UL;
        else
          ustar(i) = UR;
        end
    else 
        if UL >= 0 
          ustar(i)=UL;
        elseif UL < 0 && UR > 0
          ustar(i)=0;
        else 
          ustar(i)=UR;
        end
     end
end

end