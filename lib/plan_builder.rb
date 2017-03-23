class PlanBuilder
  include PlanBuilderData

  def initialize randomizer, num_members
    @randomizer = randomizer #repeatably random
    @num_members = num_members
  end

  def random_hex_char
    digits = (:a..:f).to_a + (0..9).to_a
    digits.shuffle(random: @randomizer).first
  end

  def gen_id length
    (0..length).map { random_hex_char }.join ''
  end

  def add_all_plans
    [
        add_plan_1(@num_members), add_plan_2(@num_members), add_plan_3(@num_members), add_plan_4(@num_members),
        add_plan_5(@num_members), add_plan_6(@num_members), add_plan_7(@num_members), add_plan_8(@num_members),
        add_plan_9(@num_members), add_plan_10(@num_members), add_plan_11(@num_members), add_plan_12(@num_members),
        add_plan_13(@num_members), add_plan_14(@num_members), add_plan_15(@num_members), add_plan_16(@num_members),
        add_plan_17(@num_members), add_plan_18(@num_members), add_plan_19(@num_members), add_plan_20(@num_members)
    ]
  end

end