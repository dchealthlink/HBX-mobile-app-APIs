module PlanBuilderData
  include Helper

  def add_plan_20 num_members
    create_kaiser_health('KP DC Silver 2750/20%/HSA/Dental/Ped Dental', num_members, deductible: 2750,
                         is_standard_plan: false, metal_level: 'silver', avg_member_premium: 247.44)
  end

  def add_plan_19 num_members
    create_kaiser_health('KP DC Silver 1800/30/Dental/Ped Dental', num_members, deductible: 1800,
                         is_standard_plan: false, metal_level: 'silver', avg_member_premium: 276.54)
  end

  def add_plan_18 num_members
    create_kaiser_health('KP DC STANDARD Silver 2000/25/Dental/Ped Dental', num_members, deductible: 2000,
                         metal_level: 'silver', avg_member_premium: 285.76)
  end

  def add_plan_17 num_members
    create_kaiser_health('KP DC STANDARD Platinum 0/20/Dental/Ped Dental', num_members, deductible: 0,
                         metal_level: 'platinum', avg_member_premium: 380.79)
  end

  def add_plan_16 num_members
    create_kaiser_health('KP DC STANDARD Gold 500/25/Dental/Ped Dental', num_members, deductible: 500,
                         metal_level: 'gold', avg_member_premium: 339.03)
  end

  def add_plan_15 num_members
    create_kaiser_health('KP DC STANDARD Bronze 5000/50/Dental/Ped Dental', num_members, deductible: 5000,
                         metal_level: 'bronze', avg_member_premium: 214.52)
  end

  def add_plan_14 num_members
    create_kaiser_health('KP DC Gold 1000/20/Dental/Ped Dental', num_members, deductible: 1000, is_standard_plan: false,
                         metal_level: 'gold', avg_member_premium: 316.93)
  end

  def add_plan_13 num_members
    create_kaiser_health('KP DC Gold 0/20/Dental/Ped Dental', num_members, deductible: 0, is_standard_plan: false,
                         metal_level: 'gold', avg_member_premium: 342.87)
  end

  def add_plan_12 num_members
    create_kaiser_health('KP DC Catastrophic 7150/0/Dental/Ped Dental', num_members, deductible: 7150,
                         is_standard_plan: false, metal_level: 'catastrophic', avg_member_premium: 173.34)
  end

  def add_plan_11 num_members
    create_kaiser_health('KP DC Bronze 6400/55/Dental/Ped Dental', num_members, deductible: 6400, is_standard_plan: false, metal_level: 'bronze', avg_member_premium: 198.38)
  end

  def add_plan_10 num_members
    create_kaiser_health('KP DC Bronze 6200/20%/HSA/Dental/Ped Dental', num_members, deductible: 6200, is_standard_plan: false, metal_level: 'bronze', avg_member_premium: 203.11)
  end

  def add_plan_9 num_members
    create_bluecross_ppo_health(num_members, deductible: 2000, metal_level: 'silver', avg_member_premium: 283.46)
  end

  def add_plan_8 num_members
    create_bluecross_ppo_health(num_members, deductible: 0, metal_level: 'platinum', avg_member_premium: 427.9)
  end

  def add_plan_7 num_members
    create_bluecross_ppo_health(num_members, deductible: 500, metal_level: 'gold', avg_member_premium: 367.59)
  end

  def add_plan_6 num_members
    create_bluecross_ppo_health(num_members, deductible: 5000, metal_level: 'bronze', avg_member_premium: 224.76)
  end

  def add_plan_5 num_members
    create_bluecross_health('BlueChoice HMO Young Adult $7,150', num_members, deductible: 7150, dc_in_network: false,
                            is_standard_plan: false, metal_level: 'catastrophic', avg_member_premium: 113.28)
  end

  def add_plan_4 num_members
    create_bluecross_standard_hmo_health(num_members, deductible: 2000, metal_level: 'silver', avg_member_premium: 267.78)
  end

  def add_plan_3 num_members
    create_bluecross_standard_hmo_health(num_members, deductible: 0, metal_level: 'platinum', avg_member_premium: 414.41)
  end

  def add_plan_2 num_members
    create_bluecross_standard_hmo_health(num_members, deductible: 500, metal_level: 'gold', avg_member_premium: 349.11)
  end

  def add_plan_1 num_members
    create_bluecross_standard_hmo_health(num_members, deductible: 5000, metal_level: 'bronze', avg_member_premium: 220.1)
  end

  #
  # Private
  #
  private

  def create_bluecross_standard_hmo_health num_members, deductible: 5000, metal_level: 'bronze', avg_member_premium: 250.00
    create_bluecross_health "BlueChoice HMO Standard #{metal_level.capitalize} $#{deductible}", num_members,
                            avg_member_premium: avg_member_premium, deductible: deductible, metal_level: metal_level,
                            provider_directory_url: 'https://member.carefirst.com/mos/#/fadpublic/search/standard?sType=M&planCode=DC_CC3&planName=BlueChoice%20HMO&isNational=N'
  end

  def create_bluecross_ppo_health num_members, deductible: 5000, metal_level: 'bronze', avg_member_premium: 250.00
    create_bluecross_health "BluePreferred PPO Standard #{metal_level.capitalize} $#{deductible}",
                            num_members, avg_member_premium: avg_member_premium, deductible: deductible,
                            metal_level: metal_level, plan_type: 'ppo', dc_in_network: false, nationwide: true,
                            provider_directory_url: 'https://member.carefirst.com/mos/#/fadpublic/search/standard?sType=M&planCode=DC_SP1&planName=Blue%20Preferred&isNational=Y'
  end

  def create_bluecross_health name, num_members, avg_member_premium: 250.00, dc_in_network: true,
                              deductible: 5000, is_standard_plan: true, metal_level: 'bronze', nationwide: false,
                              plan_type: 'hmo', provider_directory_url: nil
    create_plan name, num_members, deductible: deductible, dc_in_network: dc_in_network,
                avg_member_premium: avg_member_premium, is_standard_plan: is_standard_plan,
                metal_level: metal_level, nationwide: nationwide, plan_type: plan_type,
                provider_directory_url: provider_directory_url,
                rx_formulary_url: 'https://carefirst.com/acarx'
  end

  def create_kaiser_health name, num_members, avg_member_premium: 250.00,
                           deductible: 5000, is_standard_plan: true, metal_level: 'bronze'
    create_plan name, num_members, deductible: deductible,
                avg_member_premium: avg_member_premium, is_standard_plan: is_standard_plan,
                metal_level: metal_level,
                provider_directory_url: 'http://mydoctor.kaiserpermanente.org/mas/mdo/?kp_shortcut_referrer=kp.org/doctor',
                rx_formulary_url: 'https://healthy.kaiserpermanente.org/static/health/pdfs/formulary/mid/mid_exchange_formulary.pdf'
  end

  def create_plan name, num_members,
                  deductible: 5000,
                  dc_in_network: true, coverage_kind: 'health',
                  dental_level: '', is_standard_plan: true,
                  metal_level: 'bronze', nationwide: false,
                  plan_type: 'hmo', avg_member_premium: 250.00,
                  provider_directory_url: nil,
                  rx_formulary_url: nil,
                  active_year: 2017

    single_deductible = in_dollars deductible
    family_deductible = "#{single_deductible} per person | #{in_dollars (deductible * 2)} per group"

    hios_base_id = gen_id(14).upcase
    {
        id: gen_id(24),
        active_year: active_year,
        coverage_kind: coverage_kind,
        dc_in_network: dc_in_network,
        deductible_text: (num_members > 1) ? family_deductible : single_deductible,
        deductible: (num_members > 1) ? (deductible * 2) : deductible,
        dental_level: dental_level,
        hios_base_id: hios_base_id,
        hios_id: hios_base_id + '-01',
        is_active: true,
        is_standard_plan: is_standard_plan,
        market: 'individual',
        maximum_age: 65,
        metal_level: metal_level,
        minimum_age: 20,
        name: name, # e.g. 'BlueChoice HMO Standard Bronze $5,000',
        nationwide: nationwide,
        plan_type: 'hmo',
        total_premium: (num_members * avg_member_premium).round(2),
        provider: '',
        provider_directory_url: provider_directory_url,
        rx_formulary_url: rx_formulary_url,
        services_rates_url: ::Helper.services_rates_url,
        summary_of_benefits_url: '/document/download/dchbx-enroll-sbc-preprod/ad954b2b-81ca-4729-b440-811eead43498?content_type=application/pdf&filename=UHCChoicePlusHSAPOSGold1300A.pdf&disposition=inline'
    }
  end

end
