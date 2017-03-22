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

  def create_plan name,  num_members,
                  deductible: 5000, 
                  dc_in_network: true, coverage_kind: 'health',
                  dental_level: '', is_standard_plan: true,
                  metal_level: 'bronze', nationwide: false,
                  plan_type: 'hmo', 
                  average_premium_per_member: 250.00,
                  provider_directory_url: 'https://member.carefirst.com/mos/#/fadpublic/search/standard?sType=M&planCode=DC_CC3&planName=BlueChoice%20HMO&isNational=N',
                  rx_formulary_url: 'https://carefirst.com/acarx',
                  active_year: 2017

    single_deductible = in_dollars deductible
    family_deductible = "#{single_deductible} per person | #{in_dollars (deductible * 2)} per group"

    hios_base_id = (gen_id 14).upcase              
    {
        _id:                    (gen_id 24),
        active_year:            active_year,
        coverage_kind:          coverage_kind,
        dc_in_network:          dc_in_network,
        deductible:             (num_members > 1) ? family_deductible : single_deductible,
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
        total_premium:          (num_members * average_premium_per_member),
        provider:               '',
        provider_directory_url: provider_directory_url,
        rx_formulary_url:       rx_formulary_url,
        services_rates_url:     ::Helper.services_rates_url
    }
  end

end
