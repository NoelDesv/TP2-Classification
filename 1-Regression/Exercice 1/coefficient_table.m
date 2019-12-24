function coefficient_table( wMatrix )
    handles.T = wMatrix;
    handles.fig = figure('Position',[440 400 500 230]);
    vertical = 'w';
    for ii=1:length(wMatrix)
        vertical = [vertical 'w'];
    end
    horizontal = 'M';
    for ii=1:length(wMatrix)
        horizontal = [horizontal 'M'];
    end
    disp(vertical);
    disp(horizontal);
    
    uitable(handles.fig,'Data',handles.T{:,:},'ColumnWidth',{50},'ColumnName',vertical,...
            'RowName',horizontalName,'Position',[110 20 300 150]);
   
    
end

