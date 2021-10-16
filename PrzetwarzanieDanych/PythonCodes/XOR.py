import numpy as np

def tanh(x):
    return (1.0 -np.exp(-2*x))/(1.0 + np.exp(-2*x))

def tanh_derivative(x):
    return (1 + tanh(x))*(1 - tanh(x))

class NeuralNetwork(object):

    """Neural Network from Deep Learning book
       with tanh activation function  
    """
    def __init__(self, net_arch):
        self.activity = tanh
        self.activity_derivative = tanh_derivative
        self.layers = len(net_arch)
        self.steps_per_epoch = 1000
        self.arch = net_arch
        
        self.weights = []
        for layer in range(self.layers-1):
            w = 2*np.random.rand(net_arch[layer]+1,
                                 net_arch[layer]-1)