import http from "../http-common";

class DataServices {
    create(data) {
        return http.post("/registro")
    }
}

export default new DataServices();