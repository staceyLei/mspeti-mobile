import api from 'utils/fetch';

const login = params => api.post('/auth/oauth/token', params);

export default {
  login,
};
