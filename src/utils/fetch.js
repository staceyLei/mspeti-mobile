import AsyncStorage from '@react-native-community/async-storage';
import Toast from 'react-native-root-toast';
import qs from 'qs';

const prefix = 'http://47.101.141.240:8762';

async function request(url, params, type) {
  let newUrl = prefix + url;
  let token = '';
  try {
    token = await AsyncStorage.getItem('Auth-Token');
  } finally {
    let options = {
      method: type,
      headers: {
        'Content-Type': 'application/json',
        // token,
        // language: window.locale === 'zh-CN' ? 'zh_CN' : 'en',
      },
    };
    if (url === '/auth/oauth/token') {
      options.Authorization = 'Basic YW5kcm9pZDphbmRyb2lk';
    }
    if (type === 'post' || type === 'put' || type === 'delete') {
      if (url === '/auth/oauth/token') {
        let queryStr = '';
        if (params) {
          queryStr = '?';
          Object.keys(params).forEach(key => {
            queryStr += `${key}=${params[key]}&`;
          });
          newUrl = (newUrl + queryStr).slice(0, (newUrl + queryStr).length - 1);
        }
      } else {
        options = Object.assign(options, {
          body: JSON.stringify(params),
        });
      }
    }
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
    console.log('options', options, newUrl);
    // fetch本身不支持设置请求超时时间
    // 通过Promise.race()比较两个Promise谁先改变状态来达到请求超时的效果
    return Promise.race([
      fetch(newUrl, options)
        .then(res => {
          console.log('result', res);
          if (Object.keys(res).length) {
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
