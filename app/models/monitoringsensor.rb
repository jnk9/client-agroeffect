class Monitoringsensor
  include Mongoid::Document

  field :sensor_id,  type: Integer
  field :lectura, type: Integer
  field :date_create, type: DateTime
  field :last_date, type: DateTime

  def self.reports(id_s, params)
    match = { '$match': { 'sensor_id': id_s } }
    match = { '$match': { 'sensor_id': id_s, 'date_create': {'$gte': DateTime.parse(params['start_date']), '$lte': DateTime.parse(params['end_date']) } } } if params['start_date'].present? && params['end_date'].present?
    project = { '$project': { 'id': { 'date': { '$dateToString': { 'format': '%d-%m-%Y', 'date': '$date_create' } }, 'sensor_id': "$sensor_id" }, 'lectura': "$lectura" } }
    group = { '$group': { '_id': '$id', 'avg_value': { '$avg': '$lectura' }, 'min_value': { '$min': '$lectura' }, 'max_value': { '$max': '$lectura' } } }
    sort = { '$sort': { '_id': 1 } }
    moni = Monitoringsensor.collection.aggregate([match,project,group,sort])

    data = []
    moni.each do |m|

      x = [Date.parse(m[:_id][:date]), m[:avg_value].round(0)]

      data << x
    end
    data
  end
end
