import coremltools
from keras.models import load_model

#for security reasons, since coremltools supports .h5 format, we load the model and save it again with the correct format
k_model = load_model("model_v6_23.hdf5")

k_model.save("model_v6.h5")

output_labels = ['Angry', 'Disgust', 'Fear', 'Happy', 'Neutral', 'Sad', 'Surprise']

ml_model = coremltools.converters.keras.convert('./model_v6.h5', input_names=['image'], output_names=['output'], class_labels=output_labels, image_input_names='image')

ml_model.save('./model_v6.mlmodel')
