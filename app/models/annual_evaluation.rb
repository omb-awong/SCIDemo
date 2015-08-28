class AnnualEvaluation < ActiveRecord::Base
  belongs_to :patient

  has_one :asia_assessment, class_name: 'Asia', as: :has_asia
  accepts_nested_attributes_for :asia_assessment
  validates_associated :asia_assessment

  belongs_to :fim, class_name: 'Fim'
  accepts_nested_attributes_for :fim
  validates_associated :fim

  belongs_to :kurtzke_edss, class_name: 'KurtzkeEdss'
  accepts_nested_attributes_for :kurtzke_edss
  validates_associated :kurtzke_edss

  belongs_to :bladder_drainage_method, class_name: Domain::BladderDrainageMethod

  def episode_date
    if eval_completed.nil?
      eval_offered
    else
      eval_completed
    end
  end

  def self.collections
    {
      bladder_drainage_method: Domain::BladderDrainageMethod.collection,
      is_inpatient: [ ["Inpatient", true], ["Outpatient", false] ],
    }.with_indifferent_access
  end
end
