class ScheduleValidator < ActiveModel::Validator

  def validate(record)
    @books = Book.where(user_id: record.user_id)
    @books.each do |book|
      unless record.schedule != book.schedule
        record.errors.add :base, :invalid_schedule
      end
    end
  end
end