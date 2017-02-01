class PlanYear
  attr_reader :state, :in_renewal_OE, :in_pending_renewal

  def initialize(start_date, in_open_enrollment, in_pending_renewal, in_renewal_OE, state)
    @start_date = start_date
    @in_open_enrollment = in_open_enrollment
    @in_pending_renewal = in_pending_renewal
    @in_renewal_OE = in_renewal_OE
    @state = state
  end

  def previous
    PlanYear.new(@start_date << 12, false, false, false, "Active")
  end

  def end_of_open_enrollment
    (@start_date << 1).on(13)
  end

  def renewal_deadline
    end_of_open_enrollment - 3
  end

  def earliest_open_enrollment_begins
    @start_date << 2
  end

  def open_enrollment_begins
    earliest_open_enrollment_begins if @in_open_enrollment
  end

  def renewal_begins
    @start_date << 3
  end

  def plan_year_begins
    @start_date
  end

  #  def date_fields
  #      """\"open_enrollment_begins\" : #{fmt(open_enrollment_begins)},
  #          \"open_enrollment_ends\" : #{fmt(end_of_open_enrollment)},
  #          \"plan_year_begins\": #{fmt(plan_year_begins)},
  #          \"renewal_application_available\": #{fmt(renewal_begins)},
  #          \"renewal_application_due\": #{fmt(renewal_deadline)}"""
  #  end
end