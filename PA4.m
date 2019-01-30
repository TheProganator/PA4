bcLeft = 1; %boundry condition left side
bcRight = 1; %boudary condition right side
bcTop = 0;
bcBottom = 0;
%i = 1;
%j = 1;

nx = 12;
ny = 12;

V = zeros(nx,ny);
maxIteration = 1000;

%V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1))+V(i,(j-1)))/4;

for k = 0 : maxIteration 
    
 %   if i == 1
 %       V(i,j) = bcLeft;
 %   elseif i == nx
 %         V(i,j) = bcRight;
 %   end
  
    
        
 %   if j == 1
 %       V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1)))/3;
 %   elseif j == ny
 %          V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j-1)))/3; 
 %   end
    
    for i = 1 : (nx)
         for j = 1 : (ny)
        if i == 1
         V(i,j) = bcLeft;
        elseif i == nx
          V(i,j) = bcRight;        
        elseif j == 1
   %         V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1)))/3;
            V(i,j) = bcBottom;
        elseif j == ny
     %          V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j-1)))/3; 
               V(i,j) = bcTop;
        else  
            V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1))+V(i,(j-1)))/4;
            end
         end
    end
    
    subplot(3,1,1)
    surf(V);
    pause(0.01)
    
  % [Ex,Ey] = -gradient(V);
   %Ex = V/nx
    %Ey = V/ny;
    [Ex,Ey] = gradient(V);
    
    subplot(3,1,2)
    surf(-Ex,-Ey)
    
    subplot(3,1,3)
    quiver(-Ex,-Ey)
    pause(0.01)
    
    
end
    


