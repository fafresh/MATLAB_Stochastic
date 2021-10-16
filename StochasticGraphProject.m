clc
t = linspace(-4,4,50);

iValArray = [.1,.5,1];
mu = zeros(1,50);

for x = 1:3
mat2 = equation1(t,iValArray(x));
R2= mvnrnd(mu,mat2,5);
figure(x)
plot(t,R2,'-o','MarkerSize',3, 'LineWidth',1.1);
s1= num2str(iValArray(x));
title("Part 1:k(Xi,Xj) = exp((-1/2L)^2 * ||Xi - Xj||^2 )"  );
subtitle("When L= " +s1);
xlabel('Time t')
ylabel('y = f(x)')
end

mat = equation2(t);
R= mvnrnd(mu,mat,5);
figure(4)

plot(t,R,'-o','MarkerSize',3, 'LineWidth',1.1);
title('Part 2: Covariance Function')
subtitle('k(Xi,Xj) = Xi*Xj +0.1');
xlabel('Time')
ylabel('y = f(x)')

movegui(figure(1),'northwest');
movegui(figure(2),'north');
movegui(figure(3),'northeast');
movegui(figure(4),'south');

function equation2 = equation2(t)
C = zeros(50,50);
    for i=1:50
        for j=1:50
         C(i,j) = (t(i) * t(j)) + .1;  
        end     
    end    
equation2 = C;    
end


function equation1 = equation1(t,l)
C = zeros(50,50);
    for i=1:50
        for j=1:50
          C(i,j) = covarFunction1(l,t(i), t(j));
        end     
    end    
equation1 = C;
end

function covarFunction1 = covarFunction1(x,Xi,Xj)
subtraction = Xi - Xj;
square = power(subtraction,2);
l = x;
lVar = -1/(2*l^2);
lVarSquare = lVar * square;
eul=exp(lVarSquare);
covarFunction1 = eul;
end

