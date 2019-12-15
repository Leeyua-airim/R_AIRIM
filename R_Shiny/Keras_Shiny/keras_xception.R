library(keras)

img_path<-"E:/R/dog1.jpg"

model<-application_xception(weights = "imagenet")
model<-application_resnet50(weights = "imagenet")
model<-application_inception_v3(weights = "imagenet")

summary(model)

img<-image_load(path = img_path,target_size = c(224,224)) %>% 
  image_to_array() %>% 
  array_reshape(dim = c(1,224,224,3)) %>% 
  imagenet_preprocess_input()


preds<-model %>% predict(img)
asd<-imagenet_decode_predictions(preds = preds,top = 3)[[1]]
library(DT)
DT::datatable(asd)
