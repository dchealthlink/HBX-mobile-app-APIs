class PlanYear
  extend Helper
  attr_reader :state, :in_renewal_OE, :in_pending_renewal

  def initialize start_date, in_open_enrollment, in_pending_renewal, in_renewal_OE, state
    @start_date = start_date
    @in_open_enrollment = in_open_enrollment
    @in_pending_renewal = in_pending_renewal
    @in_renewal_OE = in_renewal_OE
    @state = state
  end

  def previous
    PlanYear.new @start_date << 12, false, false, false, 'Active'
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
    earliest_open_enrollment_begins #if @in_open_enrollment
  end

  def renewal_begins
    @start_date << 3
  end

  def plan_year_begins
    @start_date
  end

  class << self

    def in_open_enrollment
      create_plan_starting_in months: 2, in_open_enrollment: true, state: 'Enrolling'
    end

    def in_renewal_open_enrollment
      create_plan_starting_in months: 2, in_open_enrollment: true, in_renewal_OE: true, state: 'Renewing Enrolling'
    end

    def late_open_enrollment
      create_plan_starting_in months: min_months_to_enroll, in_open_enrollment: true, in_renewal_OE: true,
                              state: 'Renewing Enrolling'
    end

    def in_renewal
      create_plan_starting_in months: 2, in_pending_renewal: true, state: 'Renewing Published'
    end

    def early_renewal
      create_plan_starting_in months: 3, in_pending_renewal: true, state: 'Renewing Draft'
    end

    def late_to_renewal
      create_plan_starting_in months: min_months_to_renew, in_pending_renewal: true, state: 'Renewing Publish Pending'
    end

    def create_plan_starting_in months: 0, in_open_enrollment: false, in_pending_renewal: false, in_renewal_OE: false, state: 'Active'
      PlanYear.new (now >> months).on(1), in_open_enrollment, in_pending_renewal, in_renewal_OE, state
    end

    #
    # Private
    #
    private

    def min_months_to_enroll
      min_months 13
    end

    def min_months_to_renew
      min_months 10
    end

    def min_months days
      now.mday > days ? 2 : 1
    end

  end

end