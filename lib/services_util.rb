require_relative 'base_util'

class ServicesUtil < BaseUtil
  include Helper

  SERVICES_RATE_JSON = 'services_rates.json'

  def target_path
    "#{@use_case_directory}/#{SERVICES_RATE_JSON}"
  end

  def create_services_rates
    [
        {
            'service': 'Primary Care Visit to Treat an Injury or Illness',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Specialist Visit',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Other Practitioner Office Visit (Nurse, Physician Assistant)',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Outpatient Facility Fee (e.g.,  Ambulatory Surgery Center)',
            'copay': '$250.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Outpatient Surgery Physician/Surgical Services',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Hospice Services',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Routine Dental Services (Adult)',
            'copay': '$30.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Routine Eye Exam (Adult)',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Urgent Care Centers or Facilities',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Home Health Care Services',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Emergency Room Services',
            'copay': '$150.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Emergency Transportation/Ambulance',
            'copay': '$150.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Inpatient Hospital Services (e.g., Hospital Stay)',
            'copay': '$250.00 Copay per Day',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Inpatient Physician and Surgical Services',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Bariatric Surgery',
            'copay': '$250.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Skilled Nursing Facility',
            'copay': '$150.00 Copay per Day',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Prenatal and Postnatal Care',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Delivery and All Inpatient Services for Maternity Care',
            'copay': '$250.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Mental/Behavioral Health Outpatient Services',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Mental/Behavioral Health Inpatient Services',
            'copay': '$250.00 Copay per Day',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Substance Abuse Disorder Outpatient Services',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Substance Abuse Disorder Inpatient Services',
            'copay': '$250.00 Copay per Day',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Generic Drugs',
            'copay': '$5.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Preferred Brand Drugs',
            'copay': '$15.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Non-Preferred Brand Drugs',
            'copay': '$25.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Specialty Drugs',
            'copay': '$100.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Outpatient Rehabilitation Services',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Habilitation Services',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Chiropractic Care',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Durable Medical Equipment',
            'copay': 'Not Applicable',
            'coinsurance': '10.00%'
        },
        {
            'service': 'Imaging (CT/PET Scans, MRIs)',
            'copay': '$150.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Preventive Care/Screening/Immunization',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Weight Loss Programs',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Routine Eye Exam for Children',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Eye Glasses for Children',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Dental Check-Up for Children',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Rehabilitative Speech Therapy',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Rehabilitative Occupational and Rehabilitative Physical Therapy',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Well Baby Visits and Care',
            'copay': 'No Charge',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Laboratory Outpatient and Professional Services',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'X-rays and Diagnostic Imaging',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Basic Dental Care - Child',
            'copay': 'Not Applicable',
            'coinsurance': '31.00%'
        },
        {
            'service': 'Orthodontia - Child',
            'copay': 'Not Applicable',
            'coinsurance': '55.00%'
        },
        {
            'service': 'Major Dental Care - Child',
            'copay': 'Not Applicable',
            'coinsurance': '38.00%'
        },
        {
            'service': 'Basic Dental Care - Adult',
            'copay': 'Not Applicable',
            'coinsurance': '44.00%'
        },
        {
            'service': 'Orthodontia - Adult',
            'copay': 'Not Applicable',
            'coinsurance': '55.00%'
        },
        {
            'service': 'Major Dental Care - Adult',
            'copay': 'Not Applicable',
            'coinsurance': '49.00%'
        },
        {
            'service': 'Abortion for Which Public Funding is Prohibited',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Transplant',
            'copay': '$250.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Accidental Dental',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Dialysis',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Allergy Testing',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Chemotherapy',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Radiation',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Diabetes Education',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Prosthetic Devices',
            'copay': 'Not Applicable',
            'coinsurance': '10.00%'
        },
        {
            'service': 'Infusion Therapy',
            'copay': '$40.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Nutritional Counseling',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Reconstructive Surgery',
            'copay': '$250.00',
            'coinsurance': 'Not Applicable'
        },
        {
            'service': 'Mental Health Other',
            'copay': '$20.00',
            'coinsurance': 'Not Applicable'
        }
    ]
  end

  #
  # Private
  #
  private


end