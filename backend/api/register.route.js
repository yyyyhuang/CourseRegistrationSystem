import express from 'express';

const router = express.Router();

router.route("/courseboard").get(CoursesController.apiGetCourses);
