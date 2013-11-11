module WalmartOpen
  class Item
    API_ATTRIBUTES_MAPPING = {
      "itemId" => "id",
      "name" => "name",
      "salePrice" => "price",
      "upc" => "upc",
      "categoryNode" => "category_node",
      "shortDescription" => "short_description",
      "longDescription" => "long_description",
      "branchName" => "brand",
      "standardShipRate" => "shipping_rate",
      "size" => "size",
      "color" => "color",
      "modelNumber" => "model_number",
      "productUrl" => "url"
    }

    API_ATTRIBUTES_MAPPING.each_key do |attr_name|
      attr_reader attr_name
    end

    def initialize(attrs)
      load_known_attributes(attrs)
    end

    private

    def load_known_attributes(api_attrs)
      API_ATTRIBUTES_MAPPING.each do |api_attr, attr|
        next unless api_attrs.has_key?(api_attr)

        instance_variable_set("@#{attr}", api_attrs[api_attr])
      end
    end
  end
end