'use strict';

let aws = require('aws-sdk')
let s3 = new aws.S3();

let params = {
    Bucket: 'dev-imgur-clone-bucket-test'
}

module.exports.list = (event, context, callback) => {

    s3.listObjects(params, (err, data) => {
        if (err) {
            callback(null, {
                statusCode: 500,
                headers: {
                    'Access-Control-Allow-Origin': '*'
                },
                body: JSON.stringify({ error: err})
            });
        }

        callback(null, {
            statusCode: 200,
            headers: {
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify(data)        
        });
    })
};