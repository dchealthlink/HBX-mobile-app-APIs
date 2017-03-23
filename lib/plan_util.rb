require_relative 'base_util'
require_relative 'plan_builder'

class PlanUtil < BaseUtil
  include Helper

  PLANS_JSON = 'plans.json'

  def target_path
    "#{@use_case_directory}/#{PLANS_JSON}"
  end


  def is_valid_csr_plan plan
  	%{ silver gold platinum }.include? plan[:metal_level]
  end


  def create_valid_csr_plans_for num_members
  	create_plans_for(num_members).select{ |p| is_valid_csr_plan p }
  end

  def create_plans_for num_members
  	builder = ::PlanBuilder.new fixed_shuffler

  	[
              builder.create_bluecross_standard_hmo_health(num_members,
              	deductible: 5000, metal_level: 'bronze', avg_member_premium: 220.1),
              
              builder.create_bluecross_standard_hmo_health(num_members,                   
               deductible: 500, metal_level: 'gold', avg_member_premium: 349.11),
              
              builder.create_bluecross_standard_hmo_health(num_members,
                deductible: 0, metal_level: 'platinum', avg_member_premium: 414.41), 
              
              builder.create_bluecross_standard_hmo_health(num_members,
               deductible: 2000, metal_level: 'silver', avg_member_premium: 267.78), 
              
              builder.create_bluecross_health('BlueChoice HMO Young Adult $7,150', num_members,
              	deductible: 7150, dc_in_network: false, is_standard_plan: false, 
              	metal_level: 'catastrophic', avg_member_premium: 113.28),
              
              builder.create_bluecross_ppo_health(num_members,
              	deductible: 5000, metal_level: 'bronze', avg_member_premium: 224.76),   
              
              builder.create_bluecross_ppo_health(num_members,
              	deductible: 500, metal_level: 'gold', avg_member_premium: 367.59),    
              
              builder.create_bluecross_ppo_health(num_members,
              	deductible: 0, metal_level: 'platinum', avg_member_premium: 427.9), 

              builder.create_bluecross_ppo_health(num_members,
              	deductible: 2000, metal_level: 'silver', avg_member_premium: 283.46),    
              
              builder.create_kaiser_health('KP DC Bronze 6200/20%/HSA/Dental/Ped Dental', num_members,
              	deductible: 6200, is_standard_plan: false, metal_level: 'bronze', avg_member_premium: 203.11),    
              
              builder.create_kaiser_health('KP DC Bronze 6400/55/Dental/Ped Dental', num_members,
              	deductible: 6400, is_standard_plan: false, metal_level: 'bronze', avg_member_premium: 198.38), 
              
              builder.create_kaiser_health('KP DC Catastrophic 7150/0/Dental/Ped Dental', num_members,
              	deductible: 7150, is_standard_plan: false, metal_level: 'catastrophic', avg_member_premium: 173.34),
              
              builder.create_kaiser_health('KP DC Gold 0/20/Dental/Ped Dental', num_members,
              	deductible: 0, is_standard_plan: false, metal_level: 'gold', avg_member_premium: 342.87), 
              
              builder.create_kaiser_health('KP DC Gold 1000/20/Dental/Ped Dental', num_members,
              	deductible: 1000, is_standard_plan: false, metal_level: 'gold', avg_member_premium: 316.93), 
              
              builder.create_kaiser_health('KP DC STANDARD Bronze 5000/50/Dental/Ped Dental', num_members,
              	deductible: 5000, metal_level: 'bronze', avg_member_premium: 214.52), 
              
              builder.create_kaiser_health('KP DC STANDARD Gold 500/25/Dental/Ped Dental', num_members,
              	deductible: 500, metal_level: 'gold', avg_member_premium: 339.03),
              
              builder.create_kaiser_health('KP DC STANDARD Platinum 0/20/Dental/Ped Dental', num_members,
              	deductible: 0, metal_level: 'platinum', avg_member_premium: 380.79), 
              
              builder.create_kaiser_health('KP DC STANDARD Silver 2000/25/Dental/Ped Dental', num_members,
              	deductible: 2000, metal_level: 'silver', avg_member_premium: 285.76), 
              
              builder.create_kaiser_health('KP DC Silver 1800/30/Dental/Ped Dental', num_members,
              	deductible: 1800, is_standard_plan: false, metal_level: 'silver', avg_member_premium: 276.54), 
              
              builder.create_kaiser_health('KP DC Silver 2750/20%/HSA/Dental/Ped Dental', num_members,
              	deductible: 2750, is_standard_plan: false, metal_level: 'silver', avg_member_premium: 247.44) 
  	]

  end

end