function H = PCCSection(section_angle, section_length, num_segments)
segment_angle = section_angle/num_segments;
segment_length = section_length/num_segments;
H = eye(4);
for i = 1:num_segments
    T_temp = CCSegment(segment_angle, segment_length);
    H = H*T_temp;
end
end