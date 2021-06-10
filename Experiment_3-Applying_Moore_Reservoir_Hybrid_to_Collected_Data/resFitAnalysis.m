function resFitAnalysis(data,resoviour)
%generate the fitting data for varuois degree polynomials

figure;
maxPow = 5;
for i = 0:maxPow
    subplot(ceil((maxPow+1)/3),3,i+1);
    dispResoviours(data,resoviour,i);
end

h = colorbar('location','Manual', 'position', [0.93 0.1 0.02 0.81]);

ylabel(h, "Norm of the Residuals",'FontSize',20);

end

