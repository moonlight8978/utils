import axios from 'axios'

const httpGet = async path => {
  const response = await axios.get(path)
  return response.data
}

const Api = {
  async all() {
    return await httpGet('assets/data.json')
  },

  async metadata() {
    return await httpGet('assets/metadata.json')
  }
}

export default Api