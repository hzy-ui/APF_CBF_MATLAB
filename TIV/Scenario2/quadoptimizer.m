function [U] = quadoptimizer(H,b,A)

U=quadprog(H,[],-A,b);