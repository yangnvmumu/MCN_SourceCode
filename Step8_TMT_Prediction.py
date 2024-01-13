import numpy as np
import tensorflow as tf
from sklearn.model_selection import KFold
import xlrd
from scipy.io import loadmat

X= loadmat('****/MCN_Features')['Features']
workBook = xlrd.open_workbook('****/TMTBA_Scores.xlsx')
sheet1_content2 = workBook.sheet_by_index(0)
y= sheet1_content2.col_values(1)[1:]
y= np.array(attibutes)
kfold = KFold(n_splits=10,shuffle=True)
y_pred = []
cv_scores = []
origin_data= []
for train_index, test_index in kfold.split(X,y):
    X_train, X_test = X[train_index], X[test_index]
    y_train, y_test = y[train_index], y[test_index]
    model = tf.keras.Sequential()
    model.add(tf.keras.layers.Dense(32, input_shape=(10,),))
    model.add(tf.keras.layers.Dropout(0.25))
    model.add(tf.keras.layers.Dense(16,))
    model.add(tf.keras.layers.Dropout(0.25))
    model.add(tf.keras.layers.Dense(1,))
    model.compile(optimizer=tf.keras.optimizers.Adam(learning_rate=0.01), loss="mse")

    history = model.fit(X_train, y_train, epochs=200  , batch_size=32)
    y_pred_model = model.predict(X_test)
    y_pred_model = np.squeeze(y_pred_model)
    correlation_matrix = np.corrcoef(y_pred_model, y_test)
    correlation_coefficient = correlation_matrix[0, 1]
    cv_scores.append(correlation_coefficient)
    origin_data.append(y_test)
    y_pred.append(y_pred_model)

origin_data = np.array(origin_data)
origin_data = origin_data.ravel()
y_pred = np.array(y_pred)
y_pred = y_pred.ravel()

correlation_matrix = np.corrcoef(y_pred, origin_data)
correlation_coefficient = correlation_matrix[0, 1]
RMSE= np.sqrt(((y_pred - origin_data) ** 2).mean())

