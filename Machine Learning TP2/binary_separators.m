function binary_separators( w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    %--------------Question f--------------------
    %Entre K=1 et K=2
    f1=@(x,y) w(1,1)-w(2,1)+(w(1,2)-w(2,2))*x+(w(1,3)-w(2,3))*y;
    fc1=fcontour(f1);
    fc1.LevelList = 0;
    %Entre K=1 et K=3
    f2=@(x,y) w(1,1)-w(3,1)+(w(1,2)-w(3,2))*x+(w(1,3)-w(3,3))*y;
    fc2=fcontour(f2);
    fc2.LevelList = 0;
    %Entre K=2 et K=3
    f3=@(x,y) w(2,1)-w(3,1)+(w(2,2)-w(3,2))*x+(w(2,3)-w(3,3))*y;
    fc3=fcontour(f3);
    fc3.LevelList = 0;
end

