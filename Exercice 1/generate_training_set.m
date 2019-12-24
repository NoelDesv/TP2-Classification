function [x, t] = generate_training_set(N, std)
%GENERATION OF THE DATA
    x = ones(N,1);
    t = ones(N,1);
    for ii=1:1:N
        x(ii) = rand;
        t(ii) = sin(x(ii)*2*pi)+std*randn;
    end
end

