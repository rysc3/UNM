% Test mat-vec 

ns = [1000, 2000, 4000, 8000, 12000]; % good sizes for ns depend on machine. You might need to change this
for i=1:length(ns)
    n = ns(i);
    %Create random matrix and vectors of size n
    A = rand(n,n); x = rand(n,1);

    %Measure time using the cputime command
    t = cputime;

    %Do the epxeriment 20 times (you might want to change this as well)
    expn = 20;
    for j = 1 : expn 
       b = A*x;
    end

    %average the times
    times(i) = (cputime-t)/expn;
end

figure(2)
loglog(ns, times,'LineWidth',4)
ax = gca;
ax.FontSize = 18; 
ylabel('Time','fontsize',18)
xlabel('N','fontsize',18)
title('Avg. time for Matrix-Vector Mult.','FontWeight','normal')
xlim([ns(1),ns(end)])
% saveas(gcf, 'matvec_runtime.png')
