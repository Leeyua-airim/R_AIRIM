import sys
import io
sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPClassifier

iris =load_iris()
x,y = iris.data, iris.target

x_train,x_test,y_train,y_test = train_test_split(x,y,test_size = 0.5, random_state = 0)

nn=MLPClassifier(solver = 'sgd', random_state= 0, max_iter=10000)

nn.fit(x_train,y_train)
print(nn)
print('결과: ', nn.score(x_test,y_test))
