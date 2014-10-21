function ourParseTime(time){
  var hour = parseInt( time.split(':')[0] );
  var minutes = parseInt( time.split(':')[1] );
  var meridian = time.slice(time.length - 2);

  return { hours: hour, minutes: minutes, meridian: meridian }
};

ourParseTime("12:00pm");
// { hours: 12, minutes: 0, meridian: 'pm' }

function minutesFromMidnight(time) {
  var totalMinutes = (time['hours'] % 12 * 60) + time['minutes'];

  if (time['meridian'] == 'pm') {
    totalMinutes = totalMinutes + 720;
  }

  return totalMinutes;
}

minutesFromMidnight({ hours: 12, minutes: 0, meridian: 'am' })
// 0
minutesFromMidnight({ hours: 12, minutes: 0, meridian: 'pm' })
// 720

function countingMinutes(timeSpan) {
  startTime = ourParseTime( timeSpan.split('-')[0] );
  endTime = ourParseTime( timeSpan.split('-')[1] );

  var totalMinutes = minutesFromMidnight(endTime) - minutesFromMidnight(startTime);

  if (totalMinutes < 0) {
    totalMinutes = totalMinutes + 1440;
  }

  return totalMinutes;
};

countingMinutes("12:30pm-01:00pm")
// 30
countingMinutes("01:30am-01:15am")
// 1425