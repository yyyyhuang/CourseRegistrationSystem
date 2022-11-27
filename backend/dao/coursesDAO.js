import { pool } from '../database';

export default class CoursesDAO {
    
    static async getAllCourses(){
        try {
                // TODO: write sql
                pool.query('SELECT * FROM courses', function (err, result, fields) {
                // if (err) throw new Error(err);
                // Do something with result.
                const courseList = result.rows;
                // TODO: find row numbers
                // const totalNumCourses = 
                return { courseList, totalNumCourses};
            })
        } catch(e) {
            console.error(`Something wrong in getAllCourses: ${e}`);
            throw e;
        }
        
    }

    static async getCourseById(id){
        try{

        } catch(e){
            console.error(`Something wrong in getCourse: ${e}`);
            throw e;
        }
    }
}