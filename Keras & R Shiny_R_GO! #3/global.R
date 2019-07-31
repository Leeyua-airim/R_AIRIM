library(tidyverse)
library(shiny)
library(keras)
library(DT)
library(shinydashboard)

classify_image <- function(src_img){
  
#img <- image_load(src_img, target_size = c(299,299)) #xception
img <- image_load(src_img, target_size = c(224,224)) #resnet50
x <- image_to_array(img)

x <- array_reshape(x, c(1, dim(x)))
x <- imagenet_preprocess_input(x)

#model <- application_xception(weights = 'imagenet')
model <- application_resnet50(weights = 'imagenet')


preds <- model %>% predict(x)
main_tbl <- imagenet_decode_predictions(preds, top = 5)[[1]]

main_tbl$explore_class_on_imagenet <- sprintf(
  'Explore %s on ImageNet', 
  main_tbl$class_name,
  main_tbl$class_description)

return(main_tbl)
}