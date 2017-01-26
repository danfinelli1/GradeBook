# Grade Book

A ruby on rails application that tracks grades, assignments, and courses for students and teachers. Teachers can add students to classes, add assignments to classes, give students grades on those assignments and create new courses. Students have a much simpler view of just their personal yet useful information.



### Trouble When Building

Most Difficult Bug(kinda)

Not really a bug but a way of visualizing data. In order to get most of the functionality of this site including the grades below I really had to step back and really picture this data and how it would interact with the site and the users interacting with it.

```
def add_grade_to_student
  @course = Course.find(params[:course_id])
  @assignment = Assignment.find(params[:assignment_id])
  @student = Student.find(params[:add_grade][:student_id])
  @course_grade = Enrollment.find_by(course_id:params[:course_id], student_id:params[:add_grade][:student_id])
  @course_grade.update_attributes(tot_grade: @course_grade.tot_grade.to_i + params[:add_grade][:grade].to_i)
  @add_grade = Grade.create(grade:params[:add_grade][:grade], assignment_id:@assignment.id, student_id:@student.id)
  redirect_to assignment_show_path(course_id:@course.id, assignment_id:@assignment.id)
end
```

## Wireframe

![alt text](http://i.imgur.com/8jRNdFB.jpg "Wireframe")

## ERD

![alt text](http://i.imgur.com/dRkS1st.jpg "ERD")

## Deployment

Gradebook gave me some heroku deployment issues but overall not too many. Simply weirdest bug was a day before this project was due and deployment worked in the AM but not the PM. I got it to finally work and I believe it had something to do with old data in the database. Data that didn't have the proper attributes causing errors? Once I destroyed the database and re-migrated it seemed to have been fixed like magic.

## Built With

* [Ruby](https://www.ruby-lang.org/en/documentation/) - Programming language used
* [Rails](http://rubyonrails.org/) - Back-end used in creating the site
* [Materialize](http://materializecss.com/) - Front-end used for styling the site



## Authors

 **Daniel Finelli** -- [danfinelli1](https://github.com/danfinelli1)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
