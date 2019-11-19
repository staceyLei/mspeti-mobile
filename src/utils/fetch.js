import AsyncStorage from '@react-native-community/async-storage';
import Toast from 'react-native-root-toast';

const prefix = 'http://47.101.141.240:8765';

async function request(url, params, type) {
  let newUrl = prefix + url;
  let token = '';
  try {
    token = await AsyncStorage.getItem('Auth-Token');
  } finally {
    let options = {
      method: type,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        // token,
        // language: window.locale === 'zh-CN' ? 'zh_CN' : 'en',
        Authorization: 'Basic d2ViQXBwOjEyMzQ1Ng==',
      },
    };
    let formData = new FormData();
    Object.keys(params).map(ele => {
      formData.append(ele, params[ele]);
    });
    if (type === 'post' || type === 'put' || type === 'delete') {
      options = Object.assign(options, {
        body: JSON.stringify(params),
        // body: formData,
      });
    }
    console.log('options', options);
    if (type === 'get') {
      let queryStr = '';
      if (params) {
        queryStr = '?';
        Object.keys(params).forEach(key => {
          queryStr += `${key}=${params[key]}&`;
        });
        newUrl = (newUrl + queryStr).slice(0, (newUrl + queryStr).length - 1);
      }
    }
    // fetch本身不支持设置请求超时时间
    // 通过Promise.race()比较两个Promise谁先改变状态来达到请求超时的效果
    return Promise.race([
      fetch(newUrl, options)
        .then(res => {
          if (res.ok) {
            return res;
          }
          return Promise.reject(`${res.status}(${res.statusText})`); // eslint-disable-line
        })
        .catch(error => Promise.reject(String(error))),
      new Promise((resolve, reject) => {
        setTimeout(() => {
          reject('请求超时'); // eslint-disable-line
        }, 15000);
      }),
    ])
      .then(response => response.json())
      .then(data => {
        // if (Number(data.resultCode) === 0) {
        //   return data.resultData;
        // }
        // return Promise.reject(data.resultMsg);
        return data;
      })
      .catch(error => {
        Toast.show(error, {
          duration: 1500,
          position: Toast.positions.CENTER,
          opacity: 0.5,
        });
        return Promise.reject(error);
      });
  }
}

const methods = ['get', 'post', 'put', 'delete'];

const Fetch = {};

methods.forEach(n => {
  Fetch[n] = async (url, params) => {
    const res = await request(url, params, n);
    return res;
  };
});

export default Fetch;
