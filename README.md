# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


students = Student.where(name: 'arun')
students = Student.find(3)
marks = Mark.where('score >?', 90)
students =  Student.find_by(rollnumber: "103")
marks = Mark.where(subject: "maths")
averages = Mark.average(:score)
highest_score = Mark.where(subject: 'Maths').maximum(:score)
student_counts = Student.group(:standard).count
marks = Mark.where(score: 70..90)
students_with_marks = Student.joins(:marks).select('students.*, marks.subject, marks.score')
students_with_high_scores = Student.joins(:marks).where('marks.score > ?', 85).distinct
marks_count_by_subject = Mark.group(:subject).count
average_score_by_subject = Mark.group(:subject).average(:score)

top_students = Student
  .select('students.*, AVG(marks.score) as average_score')
  .joins(:marks)
  .group('students.id')
  .order('average_score DESC')
  .limit(3)

students_without_marks = Student.left_outer_joins(:marks).where(marks: { id: nil })
students_without_marks = Student.left_outer_joins(:marks).where(marks: { id: nil })
Mark.where(subject: 'Maths').update_all(score: 100)
Mark.where('created_at < ?', 1.year.ago).destroy_all

students_with_marks = Student.includes(:marks).all
total_score = Mark.sum(:score)
students_with_specific_marks = Student.joins(:marks).where('marks.score BETWEEN ? AND ?', 50, 80).distinct

student_names = Student.pluck(:name)

subquery = Mark.select('MAX(score)').group(:student_id)
top_students = Student.joins(:marks).where(marks: { score: subquery })
distinct_subjects = Mark.select(:subject).distinct
Mark.where('score > ?', 90).update_all('score = score + 5')

