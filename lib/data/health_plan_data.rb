class HealthPlanData

  class << self

    def health_plan_A group_difference
      {
          reference_plan_name: 'KP DC PLATINUM 500/20/DENTAL/PED DENTAL/SEL',
          reference_plan_HIOS_id: '94506DC0350009-01',
          carrier_name: 'Kaiser',
          plan_type: 'HMO',
          metal_level: 'Platinum',
          plan_option_kind: 'single_carrier',
          plans_by: 'All Plans From a Single Carrier',
          plans_by_summary_text: 'All Kaiser Plans',
          employer_contribution_by_relationship: {
              employee: 90 + group_difference,
              spouse: 80 + group_difference,
              domestic_partner: 70 + group_difference,
              child_under_26: 60 + group_difference
          },
          estimated_employer_max_monthly_cost: 6000 + (group_difference * 12),
          estimated_plan_participant_min_monthly_cost: 312 + (group_difference * 2),
          estimated_plan_participant_max_monthly_cost: 954 + (group_difference * 2)
      }
    end

    def health_plan_B group_difference
      {
          reference_plan_name: 'UHC CHOICE PLUS POS GOLD 0 B',
          reference_plan_HIOS_id: '78606AB0440009-05',
          carrier_name: 'United Health Care',
          plan_type: 'POS',
          metal_level: 'Gold',
          plan_option_kind: 'single_plan',
          plans_by: 'A Single Plan',
          plans_by_summary_text: 'Reference Plan Only',
          employer_contribution_by_relationship: {
              employee: 50 + group_difference,
              spouse: nil,
              domestic_partner: nil,
              child_under_26: 0
          },
          estimated_employer_max_monthly_cost: 6000 + (group_difference * 12),
          estimated_plan_participant_min_monthly_cost: 312 + (group_difference * 2),
          estimated_plan_participant_max_monthly_cost: 954 + (group_difference * 2)
      }
    end

  end
end