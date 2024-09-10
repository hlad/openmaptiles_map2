CREATE OR REPLACE FUNCTION layer_power(bbox geometry, zoom_level int)
RETURNS TABLE(geometry geometry, power text, osm_id bigint) AS $$
    SELECT geometry, power, osm_id
    FROM osm_power_linestring
    UNION ALL
    SELECT geometry, power, osm_id
    FROM osm_power_point
    WHERE zoom_level >= 10 AND geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;
