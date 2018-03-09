function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

% NNCOSTFUNCTION Implements the neural network cost function for a two layer
% neural network which performs classification
%    [J grad] = NNCOSTFUNCTION(nn_params, hidden_layer_size, num_labels, ...
%    X, y, lambda) computes the cost and gradient of the neural network. The
%    parameters for the neural network are "unrolled" into the vector
%    nn_params and need to be converted back into the weight matrices. 
% 
%    The returned parameter grad should be a "unrolled" vector of the
%    partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

%    f   J                      1x1                          8  double
%         Theta1                25x401                    80200  double
%         Theta1_grad           25x401                    80200  double
%         Theta2                10x26                      2080  double
%         Theta2_grad           10x26                      2080  double
%     f   X                   5000x400                 16000000  double
%   a     argn                   7x17                       119  char
%     f   hidden_layer_size      1x1                          8  double
%     f   input_layer_size       1x1                          8  double
%     f   lambda                 1x1                          8  double
%         m                      1x1                          8  double
%     f   nn_params          10285x1                      82280  double
%     f   num_labels             1x1                          8  double
%     f   y                   5000x1                      40000  double


% ==== Part 1 ====

%Feedforward
X = [ones(m,1) X];
hidden = sigmoid(X * Theta1');  
hidden = [ones(m,1) hidden];        %hidden 5000x26
out = sigmoid(hidden * Theta2');    %out    5000x10
% [v, out] = max(out, [] ,2);

tmp = 1:num_labels;
yMat = tmp;
for i = 1:m-1
    yMat = [yMat; tmp];
end
yMat = yMat==y;                     %yMat 5000x10

jMat = ( -yMat .* log(out) ) - ((1-yMat) .* log(1 - out));
J = sum(sum(jMat))/m;
Theta1Reg = Theta1(:,2:size(Theta1,2));
Theta2Reg = Theta2(:,2:size(Theta2,2));
secPart = lambda * (sum(sum(Theta1Reg.^2)) + sum(sum(Theta2Reg.^2))) / (2 * m);
J = J + secPart;

% ==== Part 2 ====
% delta_n son los errores de la capa n de cada neurona. m x num_labels
delta_3 = out - yMat;                                                       %delta_3 5000x10
delta_2 = (delta_3 * Theta2) .* sigmoidGradient([ones(m, 1) X * Theta1']);  %delta_2 5000x26

%Remove error os bias
delta_2 = delta_2(:,2:end);
Theta2_grad = (delta_3' * hidden) ./ m;             %Theta2_grad 10x26
Theta1_grad = (delta_2' * X) ./ m;                  %Theta1_grad 25x401

%Adding regularized term
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + ((lambda / m) .* Theta2(:,2:end));
Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + ((lambda / m) .* Theta1(:,2:end));











% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
