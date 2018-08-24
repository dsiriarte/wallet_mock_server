"use-strict";
const fs = require('fs')
const BaseJoi = require('joi')
const ImageExtension = require('joi-image-extension')
const concat = require('concat-stream')
 
const Joi = BaseJoi.extend(ImageExtension)
 
const schema = Joi
  .image()
  .minDimensions(100, 50)

module.exports = {
validImage: (image) => {
    fs
  .createReadStream(image)
  .pipe(concat(image => {
    Joi.validate(image, schema, (err, value) => {
      if(err) {
          return false;
      }
      return true;
    })
  }))
}
}
