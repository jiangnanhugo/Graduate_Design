from matplotlib.pyplot import figure, show
import matplotlib
import matplotlib.pyplot as plt
from numpy import arange,sin
import numpy

t = arange(-3., 3.0, 0.01)

fig = figure(1)
#%matplotlib inline
def softplus(x): # Smooth Relu
    return numpy.log(1 + numpy.exp(x))

def relu(x):
    return x * (x > 0)


plt.plot(t, relu(t),t,softplus(t))
plt.legend(['ReLU','Softplus'])
plt.grid(True)
plt.axis([-3,3,-1,3])
plt.ylabel('F(x)')
plt.xlabel('x')
plt.show()
#plt.title('Softplus and Relu')


#for label in ax1.get_xticklabels():
#    label.set_color('r')
    
#ax2 = fig.add_subplot(212)
#ax2.plot(t, softplus(2*2*t))
#ax2.grid(True)
#ax2.set_ylim((-2, 2))
#l = ax2.set_xlabel('Hi mom')
#l.set_color('g')
#l.set_fontsize('large')

