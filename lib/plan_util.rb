require_relative 'base_util'
require_relative 'plan_builder'

class PlanUtil < BaseUtil
  include Helper

  PLANS_JSON = 'plans.json'

  def target_path
    "#{@use_case_directory}/#{PLANS_JSON}"
  end

  def create_plans_for num_members
  	builder = ::PlanBuilder.new fixed_shuffler

  	[
              builder.create_plan('BlueChoice HMO Standard Bronze $5000',            num_members,
              	deductible: 5000, metal_level: 'bronze'),
              
              builder.create_plan('BlueChoice HMO Standard Gold $500',                num_members,                   
               deductible: 500, metal_level: 'gold'),
              
              builder.create_plan('BlueChoice HMO Standard Platinum $0',              num_members,                     
               deductible: 0, metal_level: 'platinum'), 
              
              builder.create_plan('BlueChoice HMO Standard Silver $2000',            num_members,                     
               deductible: 2000, metal_level: 'silver'), 
              
              builder.create_plan('BlueChoice HMO Young Adult $7,150',                num_members,
              	deductible: 7150,   dc_in_network: false, is_standard_plan: false, metal_level: 'catastrophic'),
              
              builder.create_plan('BluePreferred PPO Standard Bronze $5000',         num_members,
              	deductible: 5000,   dc_in_network: false, metal_level: 'bronze', nationwide: true, plan_type: 'ppo'),   
              
              builder.create_plan('BluePreferred PPO Standard Gold $500',             num_members,
              	deductible: 500,     dc_in_network: false, metal_level: 'gold', nationwide: true, plan_type: 'ppo'),    
              
              builder.create_plan('BluePreferred PPO Standard Platinum $0',           num_members,
              	deductible: 0,       dc_in_network: false, metal_level: 'platinum', nationwide: true, plan_type: 'ppo'),             
              builder.create_plan('BluePreferred PPO Standard Silver $2000',         num_members,
              	deductible: 2000, metal_level: 'silver', nationwide: true, plan_type: 'ppo'),    
              
              builder.create_plan('KP DC Bronze 6200/20%/HSA/Dental/Ped Dental',      num_members,
              	deductible: 6200, is_standard_plan: false, metal_level: 'bronze'),    
              
              builder.create_plan('KP DC Bronze 6400/55/Dental/Ped Dental',           num_members,
              	deductible: 6400, is_standard_plan: false, metal_level: 'bronze'), 
              
              builder.create_plan('KP DC Catastrophic 7150/0/Dental/Ped Dental',      num_members,
              	deductible: 7150, is_standard_plan: false, metal_level: 'catastrophic'),
              
              builder.create_plan('KP DC Gold 0/20/Dental/Ped Dental',                num_members,
              	deductible: 0, is_standard_plan: false, metal_level: 'gold'), 
              
              builder.create_plan('KP DC Gold 1000/20/Dental/Ped Dental',             num_members,
              	deductible: 1000, is_standard_plan: false, metal_level: 'gold'), 
              
              builder.create_plan('KP DC STANDARD Bronze 5000/50/Dental/Ped Dental',  num_members,
              	deductible: 5000, metal_level: 'bronze'), 
              
              builder.create_plan('KP DC STANDARD Gold 500/25/Dental/Ped Dental',     num_members,
              	deductible: 500, metal_level: 'gold'),
              
              builder.create_plan('KP DC STANDARD Platinum 0/20/Dental/Ped Dental',   num_members,
              	deductible: 0, metal_level: 'platinum'), 
              
              builder.create_plan('KP DC STANDARD Silver 2000/25/Dental/Ped Dental',  num_members,
              	deductible: 2000, metal_level: 'silver'), 
              
              builder.create_plan('KP DC Silver 1800/30/Dental/Ped Dental',           num_members,
              	deductible: 1800, is_standard_plan: false, metal_level: 'silver'), 
              
              builder.create_plan('KP DC Silver 2750/20%/HSA/Dental/Ped Dental',      num_members,
              	deductible: 2750, is_standard_plan: false, metal_level: 'silver') 
  	]

  end


  def create_available_plans
    #::AvailablePlanData::available_plans
    create_plans_for 1
  end

end