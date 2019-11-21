import api from 'utils/fetch';

const login = params => api.post('/auth/oauth/token', params);
const getAuth = params => api.get('/member/api/query', params);

export default {
  login,
  getAuth,
};
