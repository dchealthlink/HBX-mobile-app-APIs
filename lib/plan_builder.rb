class PlanBuilder
  include Helper

  def initialize randomizer
    @randomizer = randomizer  #repeatably random
  end

  def random_hex_char
    digits = (:a..:f).to_a + (0..9).to_a
    digits.shuffle(random: @randomizer).first
  end

  def gen_id length
    (0..length).map { random_hex_char }.join ''
  end

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

  def create_plan name,  num_members,
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

    hios_base_id = (gen_id 14).upcase
    {
        id:                    (gen_id 24),
        active_year:            active_year,
        coverage_kind:          coverage_kind,
        dc_in_network:          dc_in_network,
        deductible_text:        (num_members > 1) ? family_deductible : single_deductible,
        deductible:             (num_members > 1) ? (deductible * 2) : deductible,
        dental_level:           dental_level,
        hios_base_id:           hios_base_id,
        hios_id:                hios_base_id + '-01',
        is_active:              true,
        is_standard_plan:       is_standard_plan,
        market:                 'individual',
        maximum_age:            65,
        metal_level:            metal_level,
        minimum_age:            20,
        name:                   name, # e.g. 'BlueChoice HMO Standard Bronze $5,000',
        nationwide:             nationwide,
        plan_type:              'hmo',
        total_premium:          (num_members * avg_member_premium).round(2),
        provider:               '',
        provider_directory_url: provider_directory_url,
        rx_formulary_url:       rx_formulary_url,
        services_rates_url:     ::Helper.services_rates_url,
        summary_of_benefits_url: '/document/download/dchbx-enroll-sbc-preprod/ad954b2b-81ca-4729-b440-811eead43498?content_type=application/pdf&filename=UHCChoicePlusHSAPOSGold1300A.pdf&disposition=inline'
    }
  end

end
