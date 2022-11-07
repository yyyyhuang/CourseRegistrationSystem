import CoursesDao from "../dao/coursesDAO.js";


export default class CoursesController {
    static async apiGetStudentCourses(req, res, next){

    }

    static async apiGetAllCourses(req, res, next) {
        const coursePerPage = req.query.coursePerPage ?
            parseInt(req.query.coursePerPage) : 20;
        const page = req.query.page ? parseInt(req.query.page) : 0;
        // TODO: DOUBLE CHECK SEMSTER FORMAT
        const semester = req.query.semester ? req.query.semester : "Fall2021"
        
        let filters = {};
        // FILTER TO FIND COURSE BY ID, COURSE BY NAME AND COURSES BY STUDENT ID??
        if (req.query.nuid) {
            filters.sid = req.query.nuid;
        }


        const { courseList, totalNumCourses } = await CoursesDAO.getAllCourses({page, coursePerPage});
        let response = {
            courses : courseList,
            page: page,
            entries_per_page: coursePerPage,
            total_results: totalNumCourses
        };
        res.json(response);
    }

    static async apiGetACourse(req, res, next) {
        try {
            let id = req.params.id || {};
            let course = await CoursesDao.getACourse(id);
            if(!course) {
                res.status(404).json({ error : "not found" });
                return;
            }
            res.json(course);
        } catch(e) {
            console.log(`API, ${e}`);
            res.status(500).json({ error: e});
        }
        
    }

    static async apiregisterCourse(req, res, next) {
        try{
            const snuid = req.body.snuid;
            const cid = req.body.cid;
            const sectionId = req.body.sectionId;
            const dates = new Date();

            const registerResponse = await CoursesDao.registerCourse(
                snuid,
                cid,
                sectionId,
                dates
            );

            var { error } = registerResponse;
            console.log(error);
            if (error) {
                res.status(500).json({ error: "Unable to register a course."});
            } else {
                res.json({ status: "success"});
            }
        } catch (e) {
            res.status(500).json({ error: e.message});
        }
    }

    static async apidropCourse(req, res, next) {
        
    }

    static async apiAddACourse(req, res, next) {
        
    }

    static async apiUpdateACourse(req, res, next) {
        
    }

    static async apideleteACourse(req, res, next) {
        
    }


}