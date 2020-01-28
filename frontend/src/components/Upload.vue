<template>
    <div class="container">
        <div class="upload-wrapper">
            <h4>Upload Images</h4>
            <div class="alert alert-warning" v-if="error">{{ error }}</div>
            <div class="alert alert-info" v-if="status">{{ status }}</div>
            <div class="upload-form">
                <vue-dropzone 
                    ref="myVueDropzone" 
                    id="dropzone" 
                    v-on:vdropzone-file-added="sendingEvent"
                    :options="dropzoneOptions"></vue-dropzone>
            </div>
        </div>
    </div>
</template>

<script>
import CognitoAuth from './../cognito'
import config from './../config'
import vue2Dropzone from 'vue2-dropzone'
import axios from 'axios'

export default {
  name: "Upload",
  components: {
    vueDropzone: vue2Dropzone
  },
  data: function () {
    return {
        error: '',
        status: '',
        signurl: '',
        dropzoneOptions: {
            url: 'https://httpbin.org/post',
            thumbnailWidth: 200,
            addRemoveLinks: true,
            autoProcessQueue: false
        },
        awss3: {
            signingURL: 'http://aws-direct-s3.dev/',
            headers: {},
            params : {}
        },
    }
  },
  methods: {
      /*eslint no-unused-vars: "off"*/
    sendingEvent(file, xhr, formData) {
        this.$cognitoAuth.getIdToken((err, result) => {
            if (err) { 
                this.error = err;
            } else {
                const url = config.s3SignedUrl;
                let headers = {
                    'Authorization': result
                };
                axios({ method: 'post', url: url, headers: headers, data: { name: file.name, type: file.type }})
                    .then(x => {
                        let options = { headers: { 
                            'Content-Type': file.type,
                            'x-amz-acl': 'public-read'
                        }}
                        axios.put(x.data.uploadURL, file, options)
                    })
                    .then(status => {
                        this.status = status;
                    })
                    .catch(err => {
                        this.error = err;
                    })
            }
        })
    }
  }
};
</script>

<style scoped>
.upload-wrapper {
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  margin-top: 40px;
  border: 1px solid #E4E6E7;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.4);
}
.upload-wrapper h4 {
  font-size: 22px;
  margin: 0;
  padding: 0;
  margin-bottom: 40px;
}
.dropbox {
  outline: 2px dashed grey; /* the dash box */
  outline-offset: -10px;
  background: lightcyan;
  color: dimgray;
  padding: 10px 10px;
  min-height: 200px; /* minimum height */
  position: relative;
  cursor: pointer;
}
.input-file {
  opacity: 0; /* invisible but it's there! */
  width: 100%;
  height: 200px;
  position: absolute;
  cursor: pointer;
}
.dropbox:hover {
  background: lightblue; /* when mouse over to the drop zone, change color */
}
.dropbox p {
  font-size: 1.2em;
  text-align: center;
  padding: 50px 0;
}
</style>