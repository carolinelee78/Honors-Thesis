var instr = {
  type: 'html-keyboard-response', 
  stimulus: '<p> Welcome to the experiment! Press any key to continue. </p>'
} 

var adfes_practice_procedure = {
    timeline: [
        {
            type: 'html-keyboard-response',
            stimulus: '<p style="font-size:48px">+</p>',
            choices: jsPsych.NO_KEYS,
            trial_duration: 500
        },
        {
            type: 'video-button-response',
            stimulus: [jsPsych.timelineVariable('emotion')],
            choices: [],
            trial_ends_after_video: true,
            width: 800
        },
        {
            type: 'html-button-response',
            stimulus: '', 
            choices: ['anger', 'contempt', 'disgust', 'fear', 'happiness', 'neutral', 'pride', 'regret', 'sadness', 'surprise'],
            button_html: ['<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>']
        }
    ],
    timeline_variables: [
        { emotion: 'F06-Anger.mp4' },
        { emotion: 'F06-Contempt.mp4'},
        { emotion: 'F06-Disgust.mp4' },
        { emotion: 'F06-Embarrass.mp4'}, 
        { emotion: 'F06-Fear.mp4'},
        { emotion: 'F06-Neutral.mp4'},
        { emotion: 'F06-Sadness.mp4'},
        { emotion: 'F06-Surprise.mp4'} 
    ],
    randomize_order: true
}

var adfes_test_procedure = {
    timeline: [
        {
            type: 'html-keyboard-response',
            stimulus: '<p style="font-size:48px">+</p>',
            choices: jsPsych.NO_KEYS,
            trial_duration: 500
        },
        {
            type: 'video-button-response',
            stimulus: [jsPsych.timelineVariable('emotion')],
            choices: [],
            trial_ends_after_video: true,
            width: 800
        },
        {
            type: 'html-button-response',
            stimulus: '', 
            choices: ['anger', 'contempt', 'disgust', 'fear', 'happiness', 'neutral', 'pride', 'regret', 'sadness', 'surprise'],
            button_html: ['<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>',
            '<button class="jspsych-btn" style = "position:static">%choice%</button>', 
            '<button class="jspsych-btn" style = "position:static">%choice%</button>']
        }
    ],
    timeline_variables: [
        { emotion: 'F01-Anger-high.mp4' },
        { emotion: 'F01-Anger-med.mp4' },
        { emotion: 'F01-Anger-low.mp4' },
        { emotion: 'F01-Contempt-high.mp4' },
        { emotion: 'F01-Contempt-med.mp4' },
        { emotion: 'F01-Contempt-low.mp4' },
        { emotion: 'F01-Disgust-high.mp4' },
        { emotion: 'F01-Disgust-med.mp4' },
        { emotion: 'F01-Disgust-low.mp4' },
        { emotion: 'F01-Embarrass-high.mp4' },
        { emotion: 'F01-Embarrass-med.mp4' },
        { emotion: 'F01-Embarrass-low.mp4' },
        { emotion: 'F01-Fear-high.mp4' },
        { emotion: 'F01-Fear-med.mp4' },
        { emotion: 'F01-Fear-low.mp4' },
        { emotion: 'F01-Joy-high.mp4' },
        { emotion: 'F01-Joy-med.mp4' },
        { emotion: 'F01-Joy-low.mp4' },
        { emotion: 'F01-Neutral-1.mp4' },
        { emotion: 'F01-Neutral-2.mp4' },
        { emotion: 'F01-Neutral-3.mp4' },
        { emotion: 'F01-Pride-high.mp4' },
        { emotion: 'F01-Pride-med.mp4' },
        { emotion: 'F01-Pride-low.mp4' },
        { emotion: 'F01-Sadness-high.mp4' },
        { emotion: 'F01-Sadness-med.mp4' },
        { emotion: 'F01-Sadness-low.mp4' },
        { emotion: 'F01-Surprise-high.mp4' },
        { emotion: 'F01-Surprise-med.mp4' },
        { emotion: 'F01-Surprise-low.mp4' },
        { emotion: 'F02-Anger-high.mp4' },
        { emotion: 'F02-Anger-med.mp4' },
        { emotion: 'F02-Anger-low.mp4' },
        { emotion: 'F02-Contempt-high.mp4' },
        { emotion: 'F02-Contempt-med.mp4' },
        { emotion: 'F02-Contempt-low.mp4' },
        { emotion: 'F02-Disgust-high.mp4' },
        { emotion: 'F02-Disgust-med.mp4' },
        { emotion: 'F02-Disgust-low.mp4' },
        { emotion: 'F02-Embarrass-high.mp4' },
        { emotion: 'F02-Embarrass-med.mp4' },
        { emotion: 'F02-Embarrass-low.mp4' },
        { emotion: 'F02-Fear-high.mp4' },
        { emotion: 'F02-Fear-med.mp4' },
        { emotion: 'F02-Fear-low.mp4' },
        { emotion: 'F02-Joy-high.mp4' },
        { emotion: 'F02-Joy-med.mp4' },
        { emotion: 'F02-Joy-low.mp4' },
        { emotion: 'F02-Neutral-1.mp4' },
        { emotion: 'F02-Neutral-2.mp4' },
        { emotion: 'F02-Neutral-3.mp4' },
        { emotion: 'F02-Pride-high.mp4' },
        { emotion: 'F02-Pride-med.mp4' },
        { emotion: 'F02-Pride-low.mp4' },
        { emotion: 'F02-Sadness-high.mp4' },
        { emotion: 'F02-Sadness-med.mp4' },
        { emotion: 'F02-Sadness-low.mp4' },
        { emotion: 'F02-Surprise-high.mp4' },
        { emotion: 'F02-Surprise-med.mp4' },
        { emotion: 'F02-Surprise-low.mp4' },
        { emotion: 'F03-Anger-high.mp4' },
        { emotion: 'F03-Anger-med.mp4' },
        { emotion: 'F03-Anger-low.mp4' },
        { emotion: 'F03-Contempt-high.mp4' },
        { emotion: 'F03-Contempt-med.mp4' },
        { emotion: 'F03-Contempt-low.mp4' },
        { emotion: 'F03-Disgust-high.mp4' },
        { emotion: 'F03-Disgust-med.mp4' },
        { emotion: 'F03-Disgust-low.mp4' },
        { emotion: 'F03-Embarrass-high.mp4' },
        { emotion: 'F03-Embarrass-med.mp4' },
        { emotion: 'F03-Embarrass-low.mp4' },
        { emotion: 'F03-Fear-high.mp4' },
        { emotion: 'F03-Fear-med.mp4' },
        { emotion: 'F03-Fear-low.mp4' },
        { emotion: 'F03-Joy-high.mp4' },
        { emotion: 'F03-Joy-med.mp4' },
        { emotion: 'F03-Joy-low.mp4' },
        { emotion: 'F03-Neutral-1.mp4' },
        { emotion: 'F03-Neutral-2.mp4' },
        { emotion: 'F03-Neutral-3.mp4' },
        { emotion: 'F03-Pride-high.mp4' },
        { emotion: 'F03-Pride-med.mp4' },
        { emotion: 'F03-Pride-low.mp4' },
        { emotion: 'F03-Sadness-high.mp4' },
        { emotion: 'F03-Sadness-med.mp4' },
        { emotion: 'F03-Sadness-low.mp4' },
        { emotion: 'F03-Surprise-high.mp4' },
        { emotion: 'F03-Surprise-med.mp4' },
        { emotion: 'F03-Surprise-low.mp4' },
        { emotion: 'F04-Anger-high.mp4' },
        { emotion: 'F04-Anger-med.mp4' },
        { emotion: 'F04-Anger-low.mp4' },
        { emotion: 'F04-Contempt-high.mp4' },
        { emotion: 'F04-Contempt-med.mp4' },
        { emotion: 'F04-Contempt-low.mp4' },
        { emotion: 'F04-Disgust-high.mp4' },
        { emotion: 'F04-Disgust-med.mp4' },
        { emotion: 'F04-Disgust-low.mp4' },
        { emotion: 'F04-Embarrass-high.mp4' },
        { emotion: 'F04-Embarrass-med.mp4' },
        { emotion: 'F04-Embarrass-low.mp4' },
        { emotion: 'F04-Fear-high.mp4' },
        { emotion: 'F04-Fear-med.mp4' },
        { emotion: 'F04-Fear-low.mp4' },
        { emotion: 'F04-Joy-high.mp4' },
        { emotion: 'F04-Joy-med.mp4' },
        { emotion: 'F04-Joy-low.mp4' },
        { emotion: 'F04-Neutral-1.mp4' },
        { emotion: 'F04-Neutral-2.mp4' },
        { emotion: 'F04-Neutral-3.mp4' },
        { emotion: 'F04-Pride-high.mp4' },
        { emotion: 'F04-Pride-med.mp4' },
        { emotion: 'F04-Pride-low.mp4' },
        { emotion: 'F04-Sadness-high.mp4' },
        { emotion: 'F04-Sadness-med.mp4' },
        { emotion: 'F04-Sadness-low.mp4' },
        { emotion: 'F04-Surprise-high.mp4' },
        { emotion: 'F04-Surprise-med.mp4' },
        { emotion: 'F04-Surprise-low.mp4' },
        { emotion: 'F05-Anger-high.mp4' },
        { emotion: 'F05-Anger-med.mp4' },
        { emotion: 'F05-Anger-low.mp4' },
        { emotion: 'F05-Contempt-high.mp4' },
        { emotion: 'F05-Contempt-med.mp4' },
        { emotion: 'F05-Contempt-low.mp4' },
        { emotion: 'F05-Disgust-high.mp4' },
        { emotion: 'F05-Disgust-med.mp4' },
        { emotion: 'F05-Disgust-low.mp4' },
        { emotion: 'F05-Embarrass-high.mp4' },
        { emotion: 'F05-Embarrass-med.mp4' },
        { emotion: 'F05-Embarrass-low.mp4' },
        { emotion: 'F05-Fear-high.mp4' },
        { emotion: 'F05-Fear-med.mp4' },
        { emotion: 'F05-Fear-low.mp4' },
        { emotion: 'F05-Joy-high.mp4' },
        { emotion: 'F05-Joy-med.mp4' },
        { emotion: 'F05-Joy-low.mp4' },
        { emotion: 'F05-Neutral-1.mp4' },
        { emotion: 'F05-Neutral-2.mp4' },
        { emotion: 'F05-Neutral-3.mp4' },
        { emotion: 'F05-Pride-high.mp4' },
        { emotion: 'F05-Pride-med.mp4' },
        { emotion: 'F05-Pride-low.mp4' },
        { emotion: 'F05-Sadness-high.mp4' },
        { emotion: 'F05-Sadness-med.mp4' },
        { emotion: 'F05-Sadness-low.mp4' },
        { emotion: 'F05-Surprise-high.mp4' },
        { emotion: 'F05-Surprise-med.mp4' },
        { emotion: 'F05-Surprise-low.mp4' },
        { emotion: 'M02-Anger-high.mp4' },
        { emotion: 'M02-Anger-med.mp4' },
        { emotion: 'M02-Anger-low.mp4' },
        { emotion: 'M02-Contempt-high.mp4' },
        { emotion: 'M02-Contempt-med.mp4' },
        { emotion: 'M02-Contempt-low.mp4' },
        { emotion: 'M02-Disgust-high.mp4' },
        { emotion: 'M02-Disgust-med.mp4' },
        { emotion: 'M02-Disgust-low.mp4' },
        { emotion: 'M02-Embarrass-high.mp4' },
        { emotion: 'M02-Embarrass-med.mp4' },
        { emotion: 'M02-Embarrass-low.mp4' },
        { emotion: 'M02-Fear-high.mp4' },
        { emotion: 'M02-Fear-med.mp4' },
        { emotion: 'M02-Fear-low.mp4' },
        { emotion: 'M02-Joy-high.mp4' },
        { emotion: 'M02-Joy-med.mp4' },
        { emotion: 'M02-Joy-low.mp4' },
        { emotion: 'M02-Neutral-1.mp4' },
        { emotion: 'M02-Neutral-2.mp4' },
        { emotion: 'M02-Neutral-3.mp4' },
        { emotion: 'M02-Pride-high.mp4' },
        { emotion: 'M02-Pride-med.mp4' },
        { emotion: 'M02-Pride-low.mp4' },
        { emotion: 'M02-Sadness-high.mp4' },
        { emotion: 'M02-Sadness-med.mp4' },
        { emotion: 'M02-Sadness-low.mp4' },
        { emotion: 'M02-Surprise-high.mp4' },
        { emotion: 'M02-Surprise-med.mp4' },
        { emotion: 'M02-Surprise-low.mp4' },
        { emotion: 'M03-Anger-high.mp4' },
        { emotion: 'M03-Anger-med.mp4' },
        { emotion: 'M03-Anger-low.mp4' },
        { emotion: 'M03-Contempt-high.mp4' },
        { emotion: 'M03-Contempt-med.mp4' },
        { emotion: 'M03-Contempt-low.mp4' },
        { emotion: 'M03-Disgust-high.mp4' },
        { emotion: 'M03-Disgust-med.mp4' },
        { emotion: 'M03-Disgust-low.mp4' },
        { emotion: 'M03-Embarrass-high.mp4' },
        { emotion: 'M03-Embarrass-med.mp4' },
        { emotion: 'M03-Embarrass-low.mp4' },
        { emotion: 'M03-Fear-high.mp4' },
        { emotion: 'M03-Fear-med.mp4' },
        { emotion: 'M03-Fear-low.mp4' },
        { emotion: 'M03-Joy-high.mp4' },
        { emotion: 'M03-Joy-med.mp4' },
        { emotion: 'M03-Joy-low.mp4' },
        { emotion: 'M03-Neutral-1.mp4' },
        { emotion: 'M03-Neutral-2.mp4' },
        { emotion: 'M03-Neutral-3.mp4' },
        { emotion: 'M03-Pride-high.mp4' },
        { emotion: 'M03-Pride-med.mp4' },
        { emotion: 'M03-Pride-low.mp4' },
        { emotion: 'M03-Sadness-high.mp4' },
        { emotion: 'M03-Sadness-med.mp4' },
        { emotion: 'M03-Sadness-low.mp4' },
        { emotion: 'M03-Surprise-high.mp4' },
        { emotion: 'M03-Surprise-med.mp4' },
        { emotion: 'M03-Surprise-low.mp4' },
        { emotion: 'M04-Anger-high.mp4' },
        { emotion: 'M04-Anger-med.mp4' },
        { emotion: 'M04-Anger-low.mp4' },
        { emotion: 'M04-Contempt-high.mp4' },
        { emotion: 'M04-Contempt-med.mp4' },
        { emotion: 'M04-Contempt-low.mp4' },
        { emotion: 'M04-Disgust-high.mp4' },
        { emotion: 'M04-Disgust-med.mp4' },
        { emotion: 'M04-Disgust-low.mp4' },
        { emotion: 'M04-Embarrass-high.mp4' },
        { emotion: 'M04-Embarrass-med.mp4' },
        { emotion: 'M04-Embarrass-low.mp4' },
        { emotion: 'M04-Fear-high.mp4' },
        { emotion: 'M04-Fear-med.mp4' },
        { emotion: 'M04-Fear-low.mp4' },
        { emotion: 'M04-Joy-high.mp4' },
        { emotion: 'M04-Joy-med.mp4' },
        { emotion: 'M04-Joy-low.mp4' },
        { emotion: 'M04-Neutral-1.mp4' },
        { emotion: 'M04-Neutral-2.mp4' },
        { emotion: 'M04-Neutral-3.mp4' },
        { emotion: 'M04-Pride-high.mp4' },
        { emotion: 'M04-Pride-med.mp4' },
        { emotion: 'M04-Pride-low.mp4' },
        { emotion: 'M04-Sadness-high.mp4' },
        { emotion: 'M04-Sadness-med.mp4' },
        { emotion: 'M04-Sadness-low.mp4' },
        { emotion: 'M04-Surprise-high.mp4' },
        { emotion: 'M04-Surprise-med.mp4' },
        { emotion: 'M04-Surprise-low.mp4' },
        { emotion: 'M06-Anger-high.mp4' },
        { emotion: 'M06-Anger-med.mp4' },
        { emotion: 'M06-Anger-low.mp4' },
        { emotion: 'M06-Contempt-high.mp4' },
        { emotion: 'M06-Contempt-med.mp4' },
        { emotion: 'M06-Contempt-low.mp4' },
        { emotion: 'M06-Disgust-high.mp4' },
        { emotion: 'M06-Disgust-med.mp4' },
        { emotion: 'M06-Disgust-low.mp4' },
        { emotion: 'M06-Embarrass-high.mp4' },
        { emotion: 'M06-Embarrass-med.mp4' },
        { emotion: 'M06-Embarrass-low.mp4' },
        { emotion: 'M06-Fear-high.mp4' },
        { emotion: 'M06-Fear-med.mp4' },
        { emotion: 'M06-Fear-low.mp4' },
        { emotion: 'M06-Joy-high.mp4' },
        { emotion: 'M06-Joy-med.mp4' },
        { emotion: 'M06-Joy-low.mp4' },
        { emotion: 'M06-Neutral-1.mp4' },
        { emotion: 'M06-Neutral-2.mp4' },
        { emotion: 'M06-Neutral-3.mp4' },
        { emotion: 'M06-Pride-high.mp4' },
        { emotion: 'M06-Pride-med.mp4' },
        { emotion: 'M06-Pride-low.mp4' },
        { emotion: 'M06-Sadness-high.mp4' },
        { emotion: 'M06-Sadness-med.mp4' },
        { emotion: 'M06-Sadness-low.mp4' },
        { emotion: 'M06-Surprise-high.mp4' },
        { emotion: 'M06-Surprise-med.mp4' },
        { emotion: 'M06-Surprise-low.mp4' },
        { emotion: 'M08-Anger-high.mp4' },
        { emotion: 'M08-Anger-med.mp4' },
        { emotion: 'M08-Anger-low.mp4' },
        { emotion: 'M08-Contempt-high.mp4' },
        { emotion: 'M08-Contempt-med.mp4' },
        { emotion: 'M08-Contempt-low.mp4' },
        { emotion: 'M08-Disgust-high.mp4' },
        { emotion: 'M08-Disgust-med.mp4' },
        { emotion: 'M08-Disgust-low.mp4' },
        { emotion: 'M08-Embarrass-high.mp4' },
        { emotion: 'M08-Embarrass-med.mp4' },
        { emotion: 'M08-Embarrass-low.mp4' },
        { emotion: 'M08-Fear-high.mp4' },
        { emotion: 'M08-Fear-med.mp4' },
        { emotion: 'M08-Fear-low.mp4' },
        { emotion: 'M08-Joy-high.mp4' },
        { emotion: 'M08-Joy-med.mp4' },
        { emotion: 'M08-Joy-low.mp4' },
        { emotion: 'M08-Neutral-1.mp4' },
        { emotion: 'M08-Neutral-2.mp4' },
        { emotion: 'M08-Neutral-3.mp4' },
        { emotion: 'M08-Pride-high.mp4' },
        { emotion: 'M08-Pride-med.mp4' },
        { emotion: 'M08-Pride-low.mp4' },
        { emotion: 'M08-Sadness-high.mp4' },
        { emotion: 'M08-Sadness-med.mp4' },
        { emotion: 'M08-Sadness-low.mp4' },
        { emotion: 'M08-Surprise-high.mp4' },
        { emotion: 'M08-Surprise-med.mp4' },
        { emotion: 'M08-Surprise-low.mp4' },
        { emotion: 'M11-Anger-high.mp4' },
        { emotion: 'M11-Anger-med.mp4' },
        { emotion: 'M11-Anger-low.mp4' },
        { emotion: 'M11-Contempt-high.mp4' },
        { emotion: 'M11-Contempt-med.mp4' },
        { emotion: 'M11-Contempt-low.mp4' },
        { emotion: 'M11-Disgust-high.mp4' },
        { emotion: 'M11-Disgust-med.mp4' },
        { emotion: 'M11-Disgust-low.mp4' },
        { emotion: 'M11-Embarrass-high.mp4' },
        { emotion: 'M11-Embarrass-med.mp4' },
        { emotion: 'M11-Embarrass-low.mp4' },
        { emotion: 'M11-Fear-high.mp4' },
        { emotion: 'M11-Fear-med.mp4' },
        { emotion: 'M11-Fear-low.mp4' },
        { emotion: 'M11-Joy-high.mp4' },
        { emotion: 'M11-Joy-med.mp4' },
        { emotion: 'M11-Joy-low.mp4' },
        { emotion: 'M11-Neutral-1.mp4' },
        { emotion: 'M11-Neutral-2.mp4' },
        { emotion: 'M11-Neutral-3.mp4' },
        { emotion: 'M11-Pride-high.mp4' },
        { emotion: 'M11-Pride-med.mp4' },
        { emotion: 'M11-Pride-low.mp4' },
        { emotion: 'M11-Sadness-high.mp4' },
        { emotion: 'M11-Sadness-med.mp4' },
        { emotion: 'M11-Sadness-low.mp4' },
        { emotion: 'M11-Surprise-high.mp4' },
        { emotion: 'M11-Surprise-med.mp4' },
        { emotion: 'M11-Surprise-low.mp4' },
        { emotion: 'M12-Anger-high.mp4' },
        { emotion: 'M12-Anger-med.mp4' },
        { emotion: 'M12-Anger-low.mp4' },
        { emotion: 'M12-Contempt-high.mp4' },
        { emotion: 'M12-Contempt-med.mp4' },
        { emotion: 'M12-Contempt-low.mp4' },
        { emotion: 'M12-Disgust-high.mp4' },
        { emotion: 'M12-Disgust-med.mp4' },
        { emotion: 'M12-Disgust-low.mp4' },
        { emotion: 'M12-Embarrass-high.mp4' },
        { emotion: 'M12-Embarrass-med.mp4' },
        { emotion: 'M12-Embarrass-low.mp4' },
        { emotion: 'M12-Fear-high.mp4' },
        { emotion: 'M12-Fear-med.mp4' },
        { emotion: 'M12-Fear-low.mp4' },
        { emotion: 'M12-Joy-high.mp4' },
        { emotion: 'M12-Joy-med.mp4' },
        { emotion: 'M12-Joy-low.mp4' },
        { emotion: 'M12-Neutral-1.mp4' },
        { emotion: 'M12-Neutral-2.mp4' },
        { emotion: 'M12-Neutral-3.mp4' },
        { emotion: 'M12-Pride-high.mp4' },
        { emotion: 'M12-Pride-med.mp4' },
        { emotion: 'M12-Pride-low.mp4' },
        { emotion: 'M12-Sadness-high.mp4' },
        { emotion: 'M12-Sadness-med.mp4' },
        { emotion: 'M12-Sadness-low.mp4' },
        { emotion: 'M12-Surprise-high.mp4' },
        { emotion: 'M12-Surprise-med.mp4' },
        { emotion: 'M12-Surprise-low.mp4' }
    ],
    randomize_order: true
}

var animation_sequence = ['loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg']
  
var par_str_bb_anim_seq = ['par_str1_bb.png', 'par_str2_bb.png', 'par_str3_bb.png', 'par_str4_bb.png', 'par_str5_bb.png', 
  'par_str6_bb.png', 'par_str7_bb.png', 'par_str8_bb.png', 'par_str9_bb.png', 'par_str10_bb.png']
  
var ipd_connect_c0 = {
  type: 'animation', 
  stimuli: animation_sequence, 
  sequence_reps: 30,
  frame_time: 30,
  prompt: '<p> Please wait while we connect you to another participant...</p>',
  choices: jsPsych.NO_KEYS 
}

var ipd_intro_c0 = {
  type: 'html-button-response',
  stimulus: 
    `
    <p>In this part of the experiment, you will be playing a two-person investment game with another participant. In the two upcoming trials of the game, your score for the game will be converted to the number of tickets for a $50 lottery pool.  </p>
    <p> Press <strong>continue </strong> to proceed.</p>
   `,
  choices: ['Continue']
}


var ipd_anony_c0 = {
  type: 'html-button-response',
  stimulus: 
    `
    <p>Your ID will be <strong> Anonymous16</strong>. The other participant's ID is <strong> Anonymous35 </strong>.</p>
    <p> Press <strong>continue </strong> to proceed.</p>
   `,
  choices: ['Continue']
}

var ipd_charac_dec_c0 = {
  type: 'html-button-response',
  stimulus: 
    `
    <p> In order to guarantee anonymity, you (<strong>Anonymous16</strong>) and the other participant (<strong>Anonymous35</strong>) will be providing emotional feedback to each other using a randomly assigned, different face. </p>
    <p> Press <strong>continue </strong> to proceed to the random character assignment. Your character will be assigned first. </p>
   `,
  choices: ['Continue']
}

var animation_seq_PAR = ['loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'PAR_neutral.png']

var ipd_charac_par_anim = {
  type: 'animation', 
  stimuli: animation_seq_PAR, 
  sequence_reps: 1,
  frame_time: 30,
  prompt: '<p> Selecting a random face for your chracter ... </p>',
  choices: jsPsych.NO_KEYS 
}

var ipd_charac_par = {
  type: 'image-button-response', 
  stimulus: 'PAR_neutral.png',  
  stimulus_width: 200,
  prompt: `<p> This will be the facial character for you (<strong>Anonymous16</strong>) throughout this task. </p>
   <p> Press <strong>continue </strong> to proceed. </p>`,
  choices: ['Continue']
}

var animation_seq_A35 = ['loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'A35_neutral.png']

var ipd_charac_A35_anim = {
  type: 'animation', 
  stimuli: animation_seq_A35, 
  sequence_reps: 1,
  frame_time: 35,
  prompt: '<p> Please wait while a random facial character is generated for the other participant in the room ... </p>',
  choices: jsPsych.NO_KEYS 
}

var ipd_charac_A35 = {
  type: 'image-button-response', 
  stimulus: 'A35_neutral.png',  
  stimulus_width: 200,
  prompt: `<p> This will be the facial character for the other participant (<strong>Anonymous35</strong>) throughout this task. </p>
   <p> Press <strong>continue </strong> to proceed. </p>`,
  choices: ['Continue']
}

var ipd_instr_c0 = {
  type: 'image-button-response', 
  stimulus: 'ipd_matrix.png', 
  stimulus_width: 350, 
  prompt: `
  <p style = "font-size: 15px"><strong>Please read the following instructions carefully before proceeding. The practice trial will only begin after both participants click continue.</strong></p>
<p style = "font-size: 15px">In this investment game, you and the other player (A17) have two options for investment: project <strong><span style="color: rgb(65, 168, 95);">GREEN</span></strong> and project <strong><span style="color: rgb(41, 105, 176);">BLUE</span></strong>. You will be playing 5 rounds in total and each player will have the chance to earn points (converted to lottery tickets for a $50 lottery pool). The points for each round are determined by what you and player A17 invest in for each round. For each round, if you invest in <strong><span style="color: rgb(65, 168, 95);">GREEN</span></strong> and A17 invests in <strong><span style="color: rgb(65, 168, 95);">GREEN</span></strong>, both you each get 5 points. If you invest in <strong><span style="color: rgb(65, 168, 95);">GREEN</span></strong> and A17 invests in <strong><span style="color: rgb(41, 105, 176);">BLUE</span></strong>, you get 2 points and A17 gets 7 points. If you invest in <strong><span style="color: rgb(41, 105, 176);">BLUE</span></strong> and the other player invests in <strong><span style="color: rgb(65, 168, 95);">GREEN</span></strong>, you get 7 points and A17 gets 2 points. If you invest in <strong><span style="color: rgb(41, 105, 176);">BLUE</span></strong> and the other player invests in <strong><span style="color: rgb(41, 105, 176);">BLUE</span></strong>, you each get 3 points. <strong> There is no need to remember this </strong> - the matrix will remain on the screen throughout the full duration of the game for reference. Press <strong> continue </strong> to proceed. </p>
  `,
  choices: ['Continue'], 
  button_html: ['<button class="jspsych-btn" style = "position:absolute; left:280px; top: 230px">%choice%</button>']
}

var ipd_connect_c0 = {
  type: 'animation', 
  stimuli: animation_sequence, 
  sequence_reps: 20,
  frame_time: 30,
  prompt: '<p> Waiting for Anonymous35 to enter the room... </p>',
  choices: jsPsych.NO_KEYS 
}

var ipd_c0_co_procedure = {
    timeline: [
        {
          type: 'image-keyboard-response',
          stimulus: ['round1_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, 'g')){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var round1_coop_1 = jsPsych.data.get().last(2).values()[0].correct;
            if(round1_coop_1){
              return jsPsych.timelineVariable('counter_green_coop_r1');
            } else {
              return jsPsych.timelineVariable('counter_blue_coop_r1');
            }
          }
        },
        {
          type: 'html-keyboard-response', 
          stimulus: '',
          choices: jsPsych.ALL_KEYS,
          prompt: `<p> You will now have an opportunity to provide feedback to the Anonymous35 regarding how the outcome made you feel. Anonymous35 will receive your feedback and provide feedback as well. </p>
                   <p> Please focus on the <strong> FACIAL EMOTIONAL EXPRESSIONS </strong>, as you will use the facial emotional expressions to provide feedback. Do <strong> NOT </strong> focus on the color screens, as they are meaningless and will <strong> NOT </strong> be used for feedback. </p>
                   <p> Press any key to continue. </p>`
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var round1_coop_2 = jsPsych.data.get().last(4).values()[0].correct;
            if(round1_coop_2){
              return jsPsych.timelineVariable('par_gg_res');
            } else {
              return jsPsych.timelineVariable('par_bg_res');
            }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var round1_coop_3 = jsPsych.data.get().last(5).values()[0].correct;
            if(round1_coop_3){
              return jsPsych.timelineVariable('A35_gg_co_res');
            } else {
              return jsPsych.timelineVariable('A35_bg_co_res');
            }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var round1_coop_4 = jsPsych.data.get().last(6).values()[0].correct;
            if(round1_coop_4){
              return jsPsych.timelineVariable('A35_gg_co_res_sl');
            } else {
              return jsPsych.timelineVariable('A35_bg_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round2_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
                // get the data from the previous trial,
                // and check which key was pressed
              var data1_1 = jsPsych.data.get().last(9).values()[0];
              var data2_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data2_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r2');
              } else if(jsPsych.pluginAPI.compareKeys(data2_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r2');
              } else if(jsPsych.pluginAPI.compareKeys(data2_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r2');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r2');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data1_2 = jsPsych.data.get().last(10).values()[0];
            var data2_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data2_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data1_3 = jsPsych.data.get().last(11).values()[0];
            var data2_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data1_4 = jsPsych.data.get().last(12).values()[0];
            var data2_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data2_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data2_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data2_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round3_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data3_1 = jsPsych.data.get().last(8).values()[0];
              var data4_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data4_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r3');
              } else if(jsPsych.pluginAPI.compareKeys(data4_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r3');
              } else if(jsPsych.pluginAPI.compareKeys(data4_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r3');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r3');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data3_2 = jsPsych.data.get().last(9).values()[0];
            var data4_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data4_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data3_3 = jsPsych.data.get().last(10).values()[0];
            var data4_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data4_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data3_4 = jsPsych.data.get().last(11).values()[0];
            var data4_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data4_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data4_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data4_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round4_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data5_1 = jsPsych.data.get().last(8).values()[0];
              var data6_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data6_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r4');
              } else if(jsPsych.pluginAPI.compareKeys(data6_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r4');
              } else if(jsPsych.pluginAPI.compareKeys(data6_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r4');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r4');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data5_2 = jsPsych.data.get().last(9).values()[0];
            var data6_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data6_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data5_3 = jsPsych.data.get().last(10).values()[0];
            var data6_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data6_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data5_4 = jsPsych.data.get().last(11).values()[0];
            var data6_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data6_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data6_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data6_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round5_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data7_1 = jsPsych.data.get().last(8).values()[0];
              var data8_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data8_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r5');
              } else if(jsPsych.pluginAPI.compareKeys(data8_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r5');
              } else if(jsPsych.pluginAPI.compareKeys(data8_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r5');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r5');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data7_2 = jsPsych.data.get().last(9).values()[0];
            var data8_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data8_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data7_3 = jsPsych.data.get().last(10).values()[0];
            var data8_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data8_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data7_4 = jsPsych.data.get().last(11).values()[0];
            var data8_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data8_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data8_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data8_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round6_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data9_1 = jsPsych.data.get().last(8).values()[0];
              var data10_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data10_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r6');
              } else if(jsPsych.pluginAPI.compareKeys(data10_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r6');
              } else if(jsPsych.pluginAPI.compareKeys(data10_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r6');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r6');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data9_2 = jsPsych.data.get().last(9).values()[0];
            var data10_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data10_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data9_3 = jsPsych.data.get().last(10).values()[0];
            var data10_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data10_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data9_4 = jsPsych.data.get().last(11).values()[0];
            var data10_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data10_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data10_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data10_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round7_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data11_1 = jsPsych.data.get().last(8).values()[0];
              var data12_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data12_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r7');
              } else if(jsPsych.pluginAPI.compareKeys(data12_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r7');
              } else if(jsPsych.pluginAPI.compareKeys(data12_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r7');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r7');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data11_2 = jsPsych.data.get().last(9).values()[0];
            var data12_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data12_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data11_3 = jsPsych.data.get().last(10).values()[0];
            var data12_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data12_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data11_4 = jsPsych.data.get().last(11).values()[0];
            var data12_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data12_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data12_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data12_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round8_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data13_1 = jsPsych.data.get().last(8).values()[0];
              var data14_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data14_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r8');
              } else if(jsPsych.pluginAPI.compareKeys(data14_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r8');
              } else if(jsPsych.pluginAPI.compareKeys(data14_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r8');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r8');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data13_2 = jsPsych.data.get().last(9).values()[0];
            var data14_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data14_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data13_3 = jsPsych.data.get().last(10).values()[0];
            var data14_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data14_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data13_4 = jsPsych.data.get().last(11).values()[0];
            var data14_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data14_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data14_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data14_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round9_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data15_1 = jsPsych.data.get().last(8).values()[0];
              var data16_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data16_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r9');
              } else if(jsPsych.pluginAPI.compareKeys(data16_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r9');
              } else if(jsPsych.pluginAPI.compareKeys(data16_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r9');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r9');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data15_2 = jsPsych.data.get().last(9).values()[0];
            var data16_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data16_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data15_3 = jsPsych.data.get().last(10).values()[0];
            var data16_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data16_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data15_4 = jsPsych.data.get().last(11).values()[0];
            var data16_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data16_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data16_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data16_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round10_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data17_1 = jsPsych.data.get().last(8).values()[0];
              var data18_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data18_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r10');
              } else if(jsPsych.pluginAPI.compareKeys(data18_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r10');
              } else if(jsPsych.pluginAPI.compareKeys(data18_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r10');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r10');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data17_2 = jsPsych.data.get().last(9).values()[0];
            var data18_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data18_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data17_3 = jsPsych.data.get().last(10).values()[0];
            var data18_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data18_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data17_4 = jsPsych.data.get().last(11).values()[0];
            var data18_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data18_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data18_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data18_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round11_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data19_1 = jsPsych.data.get().last(8).values()[0];
              var data20_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data20_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r11');
              } else if(jsPsych.pluginAPI.compareKeys(data20_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r11');
              } else if(jsPsych.pluginAPI.compareKeys(data20_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r11');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r11');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data19_2 = jsPsych.data.get().last(9).values()[0];
            var data20_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data20_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data19_3 = jsPsych.data.get().last(10).values()[0];
            var data20_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data20_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data19_4 = jsPsych.data.get().last(11).values()[0];
            var data20_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data20_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data20_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data20_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round12_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data21_1 = jsPsych.data.get().last(8).values()[0];
              var data22_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data22_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r12');
              } else if(jsPsych.pluginAPI.compareKeys(data22_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r12');
              } else if(jsPsych.pluginAPI.compareKeys(data22_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r12');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r12');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data21_2 = jsPsych.data.get().last(9).values()[0];
            var data22_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data22_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data21_3 = jsPsych.data.get().last(10).values()[0];
            var data22_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data22_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data21_4 = jsPsych.data.get().last(11).values()[0];
            var data22_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data22_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data22_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data22_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round13_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data23_1 = jsPsych.data.get().last(8).values()[0];
              var data24_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data24_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r13');
              } else if(jsPsych.pluginAPI.compareKeys(data24_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r13');
              } else if(jsPsych.pluginAPI.compareKeys(data24_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data23_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r13');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r13');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data23_2 = jsPsych.data.get().last(9).values()[0];
            var data24_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data24_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data23_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data23_3 = jsPsych.data.get().last(10).values()[0];
            var data24_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data24_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data23_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
            }
          },
          {
          type: 'image-keyboard-response',
          stimulus: ['round14_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data25_1 = jsPsych.data.get().last(8).values()[0];
              var data26_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data26_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r14');
              } else if(jsPsych.pluginAPI.compareKeys(data26_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r14');
              } else if(jsPsych.pluginAPI.compareKeys(data26_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r14');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r14');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data25_2 = jsPsych.data.get().last(9).values()[0];
            var data26_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data26_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data25_3 = jsPsych.data.get().last(10).values()[0];
            var data26_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data26_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data25_4 = jsPsych.data.get().last(11).values()[0];
            var data26_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data26_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data26_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data26_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round15_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data27_1 = jsPsych.data.get().last(8).values()[0];
              var data28_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data28_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r15');
              } else if(jsPsych.pluginAPI.compareKeys(data28_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r15');
              } else if(jsPsych.pluginAPI.compareKeys(data28_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r15');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r15');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data27_2 = jsPsych.data.get().last(9).values()[0];
            var data28_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data28_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data27_3 = jsPsych.data.get().last(10).values()[0];
            var data28_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data28_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data27_4 = jsPsych.data.get().last(11).values()[0];
            var data28_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data28_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data28_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data28_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round16_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data29_1 = jsPsych.data.get().last(8).values()[0];
              var data30_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data30_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r16');
              } else if(jsPsych.pluginAPI.compareKeys(data30_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r16');
              } else if(jsPsych.pluginAPI.compareKeys(data30_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r16');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r16');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data29_2 = jsPsych.data.get().last(9).values()[0];
            var data30_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data30_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data29_3 = jsPsych.data.get().last(10).values()[0];
            var data30_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data30_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data29_4 = jsPsych.data.get().last(11).values()[0];
            var data30_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data30_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data30_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data30_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round17_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data31_1 = jsPsych.data.get().last(8).values()[0];
              var data32_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data32_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r17');
              } else if(jsPsych.pluginAPI.compareKeys(data32_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r17');
              } else if(jsPsych.pluginAPI.compareKeys(data32_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r17');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r17');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data31_2 = jsPsych.data.get().last(9).values()[0];
            var data32_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data32_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data31_3 = jsPsych.data.get().last(10).values()[0];
            var data32_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data32_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data31_4 = jsPsych.data.get().last(11).values()[0];
            var data32_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data32_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data32_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data32_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round18_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data33_1 = jsPsych.data.get().last(8).values()[0];
              var data34_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data34_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r18');
              } else if(jsPsych.pluginAPI.compareKeys(data34_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r18');
              } else if(jsPsych.pluginAPI.compareKeys(data34_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r18');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r18');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data33_2 = jsPsych.data.get().last(9).values()[0];
            var data34_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data34_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data33_3 = jsPsych.data.get().last(10).values()[0];
            var data34_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data34_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data33_4 = jsPsych.data.get().last(11).values()[0];
            var data34_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data34_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data34_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data34_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round19_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data35_1 = jsPsych.data.get().last(8).values()[0];
              var data36_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data36_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r19');
              } else if(jsPsych.pluginAPI.compareKeys(data36_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r19');
              } else if(jsPsych.pluginAPI.compareKeys(data36_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r19');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r19');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data35_2 = jsPsych.data.get().last(9).values()[0];
            var data36_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data36_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data35_3 = jsPsych.data.get().last(10).values()[0];
            var data36_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data36_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data35_4 = jsPsych.data.get().last(11).values()[0];
            var data36_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data36_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data36_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data36_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round20_matrix_c0.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous35 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data37_1 = jsPsych.data.get().last(8).values()[0];
              var data38_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data38_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r20');
              } else if(jsPsych.pluginAPI.compareKeys(data38_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r20');
              } else if(jsPsych.pluginAPI.compareKeys(data38_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r20');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r20');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['A (Leftmost)', 'B', 'C', 'D', 'E (rightmost)'],
          stimulus: function(){
            var data37_2 = jsPsych.data.get().last(9).values()[0];
            var data38_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data38_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data37_3 = jsPsych.data.get().last(10).values()[0];
            var data38_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data38_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_3.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_3.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_3.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data37_4 = jsPsych.data.get().last(11).values()[0];
            var data38_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data38_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_4.response, 'g')){
               return jsPsych.timelineVariable('A35_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data38_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_4.response, 'b')){
                return jsPsych.timelineVariable('A35_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data38_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_4.response, 'g')){
                return jsPsych.timelineVariable('A35_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A35_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        }
    ],
    timeline_variables: [
        { par_gg_res: `<p> How do you feel about this outcome? </p> <img src = "par_str_gg.gif" height="300"></img>`,
        par_bg_res: `<p> How do you feel about this outcome? </p> <img src = "par_str_bg.gif" height="300"></img>`,
        par_gb_res: `<p> How do you feel about this outcome? </p> <img src = "par_str_gb.gif" height="300"></img>`,
        par_bb_res: `<p> How do you feel about this outcome? </p> <img src = "par_str_bb.gif" height="300"></img>`,
        A35_gg_co_res: `<p> This is how Anonymous35 feels about this outcome. </p> <img src = "A35_gg_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        A35_bg_co_res: `<p> This is how Anonymous35 feels about this outcome. </p> <img src = "A35_bg_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        A35_gb_co_res: `<p> This is how Anonymous35 feels about this outcome. </p> <img src = "A35_gb_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        A35_bb_co_res: `<p> This is how Anonymous35 feels about this outcome. </p> <img src = "A35_bb_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        A35_gg_co_res_sl: `<p> How likely is Anonymous35 to choose GREEN in the next round?</p> <img src = "A35_gg_co_res.png" height="200"></img>`,
        A35_bg_co_res_sl: `<p> How likely is Anonymous35 to choose GREEN in the next round?</p> <img src = "A35_bg_co_res.png" height="200"></img>`,
        A35_gb_co_res_sl: `<p> How likely is Anonymous35 to choose GREEN in the next round?</p> <img src = "A35_gb_co_res.png" height="200"></img>`,
        A35_bb_co_res_sl: `<p> How likely is Anonymous35 to choose GREEN in the next round?</p> <img src = "A35_bb_co_res.png" height="200"></img>`,
        counter_green_coop_r1: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed. </p>",
        counter_blue_coop_r1: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed. </p>",
        counter_green_coop_r2: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 3. </p>" , 
        counter_blue_coop_r2: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 3. </p>",
        counter_green_defe_r2: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 3. </p>", 
        counter_blue_defe_r2: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 3. </p>",
        counter_green_coop_r3: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 4. </p>" , 
        counter_blue_coop_r3: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 4. </p>",
        counter_green_defe_r3: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 4. </p>", 
        counter_blue_defe_r3: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 4. </p>",
        counter_green_coop_r4: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 5. </p>" , 
        counter_blue_coop_r4: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 5. </p>",
        counter_green_defe_r4: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 5. </p>", 
        counter_blue_defe_r4: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 5. </p>",
        counter_green_coop_r5: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 6. </p>" , 
        counter_blue_coop_r5: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 6. </p>",
        counter_green_defe_r5: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 6. </p>", 
        counter_blue_defe_r5: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 6. </p>",
        counter_green_coop_r6: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 7. </p>" , 
        counter_blue_coop_r6: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 7. </p>",
        counter_green_defe_r6: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 7. </p>", 
        counter_blue_defe_r6: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 7. </p>",
        counter_blue_coop_r7: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 8. </p>",
        counter_green_defe_r7: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 8. </p>", 
        counter_blue_defe_r7: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 8. </p>",
        counter_blue_defe_r7: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 8. </p>",
        counter_blue_coop_r8: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 9. </p>",
        counter_green_defe_r8: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 9. </p>", 
        counter_blue_defe_r8: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 9. </p>",
        counter_blue_defe_r8: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 9. </p>",
        counter_blue_coop_r9: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 10. </p>",
        counter_green_defe_r9: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 10. </p>", 
        counter_blue_defe_r9: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 10. </p>",
        counter_blue_defe_r9: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 10. </p>",
        counter_blue_coop_r10: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 11. </p>",
        counter_green_defe_r10: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 11. </p>", 
        counter_blue_defe_r10: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 11. </p>",
        counter_blue_defe_r10: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 11. </p>",
        counter_blue_coop_r11: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 12. </p>",
        counter_green_defe_r11: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 12. </p>", 
        counter_blue_defe_r11: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 12. </p>",
        counter_blue_defe_r11: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 12. </p>",
        counter_blue_coop_r12: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 13. </p>",
        counter_green_defe_r12: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 13. </p>", 
        counter_blue_defe_r12: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 13. </p>",
        counter_blue_defe_r12: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 13. </p>",
        counter_blue_coop_r13: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 14. </p>",
        counter_green_defe_r13: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 14. </p>", 
        counter_blue_defe_r13: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 14. </p>",
        counter_blue_defe_r13: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 14. </p>",
        counter_blue_coop_r14: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 15. </p>",
        counter_green_defe_r14: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 15. </p>", 
        counter_blue_defe_r14: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 15. </p>",
        counter_blue_defe_r14: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 15. </p>",
        counter_blue_coop_r15: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 16. </p>",
        counter_green_defe_r15: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 16. </p>", 
        counter_blue_defe_r15: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 16. </p>",
        counter_blue_defe_r15: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 16. </p>",
        counter_blue_coop_r16: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 17. </p>",
        counter_green_defe_r16: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 17. </p>", 
        counter_blue_defe_r16: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 17. </p>",
        counter_blue_defe_r16: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 17. </p>",
        counter_blue_coop_r17: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 18. </p>",
        counter_green_defe_r17: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 18. </p>", 
        counter_blue_defe_r17: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 18. </p>",
        counter_blue_defe_r17: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 18. </p>",
        counter_blue_coop_r18: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 19. </p>",
        counter_green_defe_r18: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 19. </p>", 
        counter_blue_defe_r18: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 19. </p>",
        counter_blue_defe_r18: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 19. </p>",
        counter_blue_coop_r19: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed to Round 20. </p>",
        counter_green_defe_r19: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed to Round 20. </p>", 
        counter_blue_defe_r19: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 20. </p>",
        counter_blue_defe_r19: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 20. </p>",
        counter_blue_coop_r20: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous35 received <strong>2 points</strong>. Press any key to proceed. </p>",
        counter_green_defe_r20: "<p> You chose <strong>GREEN</strong>. Anonymous35 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous35 received <strong>7 points</strong>. Press any key to proceed. </p>", 
        counter_blue_defe_r20: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed. </p>",
        counter_blue_defe_r20: "<p> You chose <strong>BLUE</strong>. Anonymous35 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed. </p>"
        }
    ]
}

var ipd_intro_c1 = {
  type: 'html-button-response',
  stimulus: 
    `
    <p> You will be playing another 20 rounds with a different participant online who is also beginning the second trial. As a reminder, the previous trial was a practice trial. Starting with this trial, your score will count towards calculating the amount of tickets for the $50 lottery pool. </p>
    <p> Press <strong>continue </strong> to proceed.</p>
   `,
  choices: ['Continue']
}

var ipd_anony_c1 = {
  type: 'html-button-response',
  stimulus: 
    `
    <p>Your ID will be <strong> Anonymous16</strong>. The other participant's ID is <strong> Anonymous17 </strong>.</p>
    <p> Press <strong>continue </strong> to proceed.</p>
   `,
  choices: ['Continue']
}

var ipd_charac_dec_c1 = {
  type: 'html-button-response',
  stimulus: 
    `
    <p> In order to guarantee anonymity, you (<strong>Anonymous16</strong>) and the other participant (<strong>Anonymous17</strong>) will be providing emotional feedback to each other using a randomly assigned, different face. </p>
    <p> Press <strong>continue </strong> to proceed. </p>
   `,
  choices: ['Continue']
}

var animation_seq_A17 = ['loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'loading_1.jpg', 'loading_2.jpg', 'loading_3.jpg', 'loading_4.jpg', 'loading_5.jpg',
  'loading_6.jpg', 'loading_7.jpg', 'loading_8.jpg', 'loading_9.jpg', 'loading_10.jpg', 'loading_11.jpg', 'loading_12.jpg',
  'loading_13.jpg', 'loading_14.jpg', 'loading_15.jpg', 'loading_16.jpg', 'loading_17.jpg', 'loading_18.jpg', 'loading_19.jpg',
  'loading_20.jpg', 'loading_21.jpg', 'loading_22.jpg', 'loading_23.jpg', 'loading_24.jpg', 'loading_25.jpg', 'loading_26.jpg',
  'loading_27.jpg', 'loading_28.jpg', 'loading_29.jpg', 'A17_neutral.png']

var ipd_charac_A17_anim = {
  type: 'animation', 
  stimuli: animation_seq_A17, 
  sequence_reps: 1,
  frame_time: 35,
  prompt: '<p> Please wait while a random facial character is generated for the other participant in the room ... </p>',
  choices: jsPsych.NO_KEYS 
}

var ipd_charac_A17 = {
  type: 'image-button-response', 
  stimulus: 'A17_neutral.png',  
  stimulus_width: 200,
  prompt: `<p> This will be the facial character for the other participant (<strong>Anonymous17</strong>) throughout this task. </p>
   <p> Press <strong>continue </strong> to proceed. </p>`,
  choices: ['Continue']
}

var ipd_instr_c1 = {
  type: 'image-button-response', 
  stimulus: 'ipd_matrix.png', 
  stimulus_width: 350, 
  prompt: '<p> Press <strong> continue </strong> to enter the room and start the second trial. </p>',
  choices: ['Continue'], 
  button_html: ['<button class="jspsych-btn" style = "position:absolute; left:280px; top: 230px">%choice%</button>']
}

var ipd_connect_c1 = {
  type: 'animation', 
  stimuli: animation_sequence, 
  sequence_reps: 20,
  frame_time: 30,
  prompt: '<p> Waiting for Anonymous17 to enter the room... </p>',
  choices: jsPsych.NO_KEYS 
}

var ipd_c1_procedure = {
    timeline: [
        {
          type: 'image-keyboard-response',
          stimulus: ['round1_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, 'g')){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var round1_coop_1 = jsPsych.data.get().last(2).values()[0].correct;
            if(round1_coop_1){
              return jsPsych.timelineVariable('counter_green_coop_r1');
            } else {
              return jsPsych.timelineVariable('counter_blue_coop_r1');
            }
          }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var round1_coop_2 = jsPsych.data.get().last(3).values()[0].correct;
            if(round1_coop_2){
              return jsPsych.timelineVariable('par_gg_res');
            } else {
              return jsPsych.timelineVariable('par_bg_res');
            }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var round1_coop_3 = jsPsych.data.get().last(4).values()[0].correct;
            if(round1_coop_3){
              return jsPsych.timelineVariable('A17_gg_co_res');
            } else {
              return jsPsych.timelineVariable('A17_bg_co_res');
            }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var round1_coop_4 = jsPsych.data.get().last(5).values()[0].correct;
            if(round1_coop_4){
              return jsPsych.timelineVariable('A17_gg_co_res_sl');
            } else {
              return jsPsych.timelineVariable('A17_bg_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round2_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
                // get the data from the previous trial,
                // and check which key was pressed
              var data1_1 = jsPsych.data.get().last(8).values()[0];
              var data2_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data2_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r2');
              } else if(jsPsych.pluginAPI.compareKeys(data2_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r2');
              } else if(jsPsych.pluginAPI.compareKeys(data2_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r2');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r2');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data1_2 = jsPsych.data.get().last(9).values()[0];
            var data2_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data2_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'image-keyboard-response', 
          stimulus: function(){
            var data1_3 = jsPsych.data.get().last(10).values()[0];
            var data2_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'g')){
               return jsPsych.timelineVariable('par_str_gg');
              } else if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'b')){
                return jsPsych.timelineVariable('par_str_gb');
              } else if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'g')){
                return jsPsych.timelineVariable('par_str_bg');
              } else {
                return jsPsych.timelineVariable('par_str_bb');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data1_4 = jsPsych.data.get().last(11).values()[0];
            var data2_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data2_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data1_5 = jsPsych.data.get().last(12).values()[0];
            var data2_5 = jsPsych.data.get().last(6).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data2_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data2_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data1_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data2_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data1_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round3_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data3_1 = jsPsych.data.get().last(8).values()[0];
              var data4_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data4_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r3');
              } else if(jsPsych.pluginAPI.compareKeys(data4_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r3');
              } else if(jsPsych.pluginAPI.compareKeys(data4_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r3');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r3');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data3_2 = jsPsych.data.get().last(9).values()[0];
            var data4_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data4_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data3_3 = jsPsych.data.get().last(10).values()[0];
            var data4_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data4_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data4_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data3_4 = jsPsych.data.get().last(11).values()[0];
            var data4_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data4_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data4_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data3_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data4_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data3_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round4_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data5_1 = jsPsych.data.get().last(8).values()[0];
              var data6_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data6_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r4');
              } else if(jsPsych.pluginAPI.compareKeys(data6_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r4');
              } else if(jsPsych.pluginAPI.compareKeys(data6_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r4');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r4');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data5_2 = jsPsych.data.get().last(9).values()[0];
            var data6_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data6_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data5_3 = jsPsych.data.get().last(10).values()[0];
            var data6_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data6_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data6_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data5_4 = jsPsych.data.get().last(11).values()[0];
            var data6_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data6_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data6_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data5_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data6_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data5_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round5_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data7_1 = jsPsych.data.get().last(8).values()[0];
              var data8_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data8_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r5');
              } else if(jsPsych.pluginAPI.compareKeys(data8_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r5');
              } else if(jsPsych.pluginAPI.compareKeys(data8_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r5');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r5');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data7_2 = jsPsych.data.get().last(9).values()[0];
            var data8_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data8_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data7_3 = jsPsych.data.get().last(10).values()[0];
            var data8_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data8_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data8_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data7_4 = jsPsych.data.get().last(11).values()[0];
            var data8_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data8_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data8_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data7_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data8_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data7_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round6_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data9_1 = jsPsych.data.get().last(8).values()[0];
              var data10_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data10_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r6');
              } else if(jsPsych.pluginAPI.compareKeys(data10_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r6');
              } else if(jsPsych.pluginAPI.compareKeys(data10_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r6');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r6');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data9_2 = jsPsych.data.get().last(9).values()[0];
            var data10_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data10_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data9_3 = jsPsych.data.get().last(10).values()[0];
            var data10_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data10_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data10_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data9_4 = jsPsych.data.get().last(11).values()[0];
            var data10_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data10_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data10_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data9_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data10_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data9_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round7_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data11_1 = jsPsych.data.get().last(8).values()[0];
              var data12_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data12_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r7');
              } else if(jsPsych.pluginAPI.compareKeys(data12_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r7');
              } else if(jsPsych.pluginAPI.compareKeys(data12_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r7');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r7');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data11_2 = jsPsych.data.get().last(9).values()[0];
            var data12_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data12_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data11_3 = jsPsych.data.get().last(10).values()[0];
            var data12_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data12_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data12_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data11_4 = jsPsych.data.get().last(11).values()[0];
            var data12_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data12_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data12_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data11_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data12_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data11_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round8_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data13_1 = jsPsych.data.get().last(8).values()[0];
              var data14_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data14_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r8');
              } else if(jsPsych.pluginAPI.compareKeys(data14_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r8');
              } else if(jsPsych.pluginAPI.compareKeys(data14_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r8');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r8');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data13_2 = jsPsych.data.get().last(9).values()[0];
            var data14_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data14_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data13_3 = jsPsych.data.get().last(10).values()[0];
            var data14_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data14_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data14_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data13_4 = jsPsych.data.get().last(11).values()[0];
            var data14_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data14_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data14_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data13_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data14_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data13_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round9_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data15_1 = jsPsych.data.get().last(8).values()[0];
              var data16_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data16_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r9');
              } else if(jsPsych.pluginAPI.compareKeys(data16_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r9');
              } else if(jsPsych.pluginAPI.compareKeys(data16_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r9');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r9');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data15_2 = jsPsych.data.get().last(9).values()[0];
            var data16_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data16_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data15_3 = jsPsych.data.get().last(10).values()[0];
            var data16_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data16_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data16_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data15_4 = jsPsych.data.get().last(11).values()[0];
            var data16_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data16_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data16_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data15_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data16_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data15_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round10_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data17_1 = jsPsych.data.get().last(8).values()[0];
              var data18_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data18_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r10');
              } else if(jsPsych.pluginAPI.compareKeys(data18_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r10');
              } else if(jsPsych.pluginAPI.compareKeys(data18_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r10');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r10');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data17_2 = jsPsych.data.get().last(9).values()[0];
            var data18_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data18_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data17_3 = jsPsych.data.get().last(10).values()[0];
            var data18_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data18_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data18_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data17_4 = jsPsych.data.get().last(11).values()[0];
            var data18_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data18_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data18_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data17_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data18_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data17_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round11_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data19_1 = jsPsych.data.get().last(8).values()[0];
              var data20_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data20_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r11');
              } else if(jsPsych.pluginAPI.compareKeys(data20_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r11');
              } else if(jsPsych.pluginAPI.compareKeys(data20_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r11');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r11');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data19_2 = jsPsych.data.get().last(9).values()[0];
            var data20_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data20_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data19_3 = jsPsych.data.get().last(10).values()[0];
            var data20_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data20_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data20_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data19_4 = jsPsych.data.get().last(11).values()[0];
            var data20_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data20_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data20_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data19_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data20_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data19_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round12_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data21_1 = jsPsych.data.get().last(8).values()[0];
              var data22_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data22_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r12');
              } else if(jsPsych.pluginAPI.compareKeys(data22_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r12');
              } else if(jsPsych.pluginAPI.compareKeys(data22_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r12');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r12');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data21_2 = jsPsych.data.get().last(9).values()[0];
            var data22_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data22_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data21_3 = jsPsych.data.get().last(10).values()[0];
            var data22_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data22_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data22_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data21_4 = jsPsych.data.get().last(11).values()[0];
            var data22_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data22_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data22_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data21_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data22_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data21_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round13_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data23_1 = jsPsych.data.get().last(8).values()[0];
              var data24_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data24_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r13');
              } else if(jsPsych.pluginAPI.compareKeys(data24_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r13');
              } else if(jsPsych.pluginAPI.compareKeys(data24_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data23_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r13');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r13');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data23_2 = jsPsych.data.get().last(9).values()[0];
            var data24_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data24_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data23_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data23_3 = jsPsych.data.get().last(10).values()[0];
            var data24_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data24_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data23_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data24_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data23_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
            }
          },
          {
          type: 'image-keyboard-response',
          stimulus: ['round14_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data25_1 = jsPsych.data.get().last(8).values()[0];
              var data26_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data26_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r14');
              } else if(jsPsych.pluginAPI.compareKeys(data26_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r14');
              } else if(jsPsych.pluginAPI.compareKeys(data26_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r14');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r14');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data25_2 = jsPsych.data.get().last(9).values()[0];
            var data26_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data26_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data25_3 = jsPsych.data.get().last(10).values()[0];
            var data26_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data26_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data26_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data25_4 = jsPsych.data.get().last(11).values()[0];
            var data26_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data26_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data26_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data25_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data26_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data25_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round15_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data27_1 = jsPsych.data.get().last(8).values()[0];
              var data28_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data28_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r15');
              } else if(jsPsych.pluginAPI.compareKeys(data28_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r15');
              } else if(jsPsych.pluginAPI.compareKeys(data28_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r15');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r15');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data27_2 = jsPsych.data.get().last(9).values()[0];
            var data28_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data28_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data27_3 = jsPsych.data.get().last(10).values()[0];
            var data28_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data28_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data28_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data27_4 = jsPsych.data.get().last(11).values()[0];
            var data28_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data28_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data28_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data27_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data28_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data27_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round16_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data29_1 = jsPsych.data.get().last(8).values()[0];
              var data30_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data30_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r16');
              } else if(jsPsych.pluginAPI.compareKeys(data30_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r16');
              } else if(jsPsych.pluginAPI.compareKeys(data30_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r16');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r16');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data29_2 = jsPsych.data.get().last(9).values()[0];
            var data30_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data30_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data29_3 = jsPsych.data.get().last(10).values()[0];
            var data30_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data30_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data30_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data29_4 = jsPsych.data.get().last(11).values()[0];
            var data30_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data30_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data30_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data29_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data30_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data29_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round17_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data31_1 = jsPsych.data.get().last(8).values()[0];
              var data32_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data32_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r17');
              } else if(jsPsych.pluginAPI.compareKeys(data32_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r17');
              } else if(jsPsych.pluginAPI.compareKeys(data32_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r17');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r17');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data31_2 = jsPsych.data.get().last(9).values()[0];
            var data32_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data32_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data31_3 = jsPsych.data.get().last(10).values()[0];
            var data32_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data32_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data32_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data31_4 = jsPsych.data.get().last(11).values()[0];
            var data32_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data32_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data32_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data31_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data32_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data31_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round18_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data33_1 = jsPsych.data.get().last(8).values()[0];
              var data34_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data34_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r18');
              } else if(jsPsych.pluginAPI.compareKeys(data34_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r18');
              } else if(jsPsych.pluginAPI.compareKeys(data34_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r18');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r18');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data33_2 = jsPsych.data.get().last(9).values()[0];
            var data34_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data34_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data33_3 = jsPsych.data.get().last(10).values()[0];
            var data34_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data34_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data34_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data33_4 = jsPsych.data.get().last(11).values()[0];
            var data34_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data34_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data34_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data33_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data34_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data33_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round19_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data35_1 = jsPsych.data.get().last(8).values()[0];
              var data36_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data36_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r19');
              } else if(jsPsych.pluginAPI.compareKeys(data36_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r19');
              } else if(jsPsych.pluginAPI.compareKeys(data36_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r19');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r19');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data35_2 = jsPsych.data.get().last(9).values()[0];
            var data36_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data36_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data35_3 = jsPsych.data.get().last(10).values()[0];
            var data36_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data36_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data36_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data35_4 = jsPsych.data.get().last(11).values()[0];
            var data36_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data36_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data36_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data35_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data36_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data35_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        },
        {
          type: 'image-keyboard-response',
          stimulus: ['round20_matrix.png'],
          stimulus_width: 500,
          prompt: '<p> Please press <strong>G</strong> on the keyboard to invest in <strong>GREEN</strong> and <strong>B</strong> on the keyboard to invest in <strong>BLUE</strong>.</p>', 
          choices: ['g','b'],
          on_finish: function(data){
            // Score the response as correct or incorrect.
            if(jsPsych.pluginAPI.compareKeys(data.response, "g")){
              data.correct = true;
            } else {
              data.correct = false; 
            }
          }
        },
        {
            type: 'animation', 
            stimuli: animation_sequence, 
            sequence_reps: 10,
            frame_time: 30,
            prompt: '<p> Waiting for Anonymous17 to invest ... </p>',
            choices: jsPsych.NO_KEYS 
        },
        {
            type: 'html-keyboard-response',
            stimulus: function(){
              var data37_1 = jsPsych.data.get().last(8).values()[0];
              var data38_1 = jsPsych.data.get().last(2).values()[0];
              if(jsPsych.pluginAPI.compareKeys(data38_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_1.response, 'g')){
               return jsPsych.timelineVariable('counter_green_coop_r20');
              } else if(jsPsych.pluginAPI.compareKeys(data38_1.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_1.response, 'b')){
                return jsPsych.timelineVariable('counter_green_defe_r20');
              } else if(jsPsych.pluginAPI.compareKeys(data38_1.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_1.response, 'g')){
                return jsPsych.timelineVariable('counter_blue_coop_r20');
              } else {
                return jsPsych.timelineVariable('counter_blue_defe_r20');
              }
           }
        },
        {
          type: 'html-button-response',
          choices: ['Neutral', 'Happy', 'Sad', 'Angry', 'Regretful'],
          stimulus: function(){
            var data37_2 = jsPsych.data.get().last(9).values()[0];
            var data38_2 = jsPsych.data.get().last(3).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data38_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_2.response, 'g')){
               return jsPsych.timelineVariable('par_gg_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_2.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_2.response, 'b')){
                return jsPsych.timelineVariable('par_gb_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_2.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_2.response, 'g')){
                return jsPsych.timelineVariable('par_bg_res');
              } else {
                return jsPsych.timelineVariable('par_bb_res');
              }
          }
        },
        {
          type: 'html-keyboard-response',
          stimulus: function(){
            var data37_3 = jsPsych.data.get().last(10).values()[0];
            var data38_3 = jsPsych.data.get().last(4).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data38_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_3.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_3.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_3.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res');
              } else if(jsPsych.pluginAPI.compareKeys(data38_3.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_3.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res');
              }
          }
        },
        {
          type: 'html-slider-response',
          stimulus: function(){
            var data37_4 = jsPsych.data.get().last(11).values()[0];
            var data38_4 = jsPsych.data.get().last(5).values()[0];
            if(jsPsych.pluginAPI.compareKeys(data38_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_4.response, 'g')){
               return jsPsych.timelineVariable('A17_gg_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data38_4.response, 'g') && jsPsych.pluginAPI.compareKeys(data37_4.response, 'b')){
                return jsPsych.timelineVariable('A17_gb_co_res_sl');
              } else if(jsPsych.pluginAPI.compareKeys(data38_4.response, 'b') && jsPsych.pluginAPI.compareKeys(data37_4.response, 'g')){
                return jsPsych.timelineVariable('A17_bg_co_res_sl');
              } else {
                return jsPsych.timelineVariable('A17_bb_co_res_sl');
            }
          },
          labels: ['Likely BLUE', 'Likely GREEN']
        }
    ],
    timeline_variables: [
        { par_gg_res: `<p> How do you feel about this outcome? </p> <img src = "par_str1_gg.png" height="200"></img> `,
        par_bg_res: `<p> How do you feel about this outcome? </p> <img src = "par_str1_bg.png" height="200"></img>`,
        par_gb_res: `<p> How do you feel about this outcome? </p> <img src = "par_str1_gb.png" height="200"></img>`,
        par_bb_res: `<p> How do you feel about this outcome? </p> <img src = "par_str1_bb.png" height="200"></img>`,
        A17_gg_co_res: `<p> This is how Anonymous17 feels about this outcome. </p> <img src = "A17_gg_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        A17_bg_co_res: `<p> This is how Anonymous17 feels about this outcome. </p> <img src = "A17_bg_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        A17_gb_co_res: `<p> This is how Anonymous17 feels about this outcome. </p> <img src = "A17_gb_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        A17_bb_co_res: `<p> This is how Anonymous17 feels about this outcome. </p> <img src = "A17_bb_co_res.png" height="200"></img> <p> Press any key to continue. </p>`,
        par_str_gg: `<img src = "par_str_gg.gif" height="200"</img>`, 
        par_str_gb: `<img src = "par_str_gb.gif" height="200"</img>`, 
        par_str_bb: `<img src = "par_str_bb.gif" height="200"</img>`, 
        par_str_bg: `<img src = "par_str_bg.gif" height="200"</img>`, 
        A17_gg_co_res_sl: `<p> How likely is Anonymous17 to choose GREEN in the next round?</p> <img src = "A17_gg_co_res.png" height="200"></img>`,
        A17_bg_co_res_sl: `<p> How likely is Anonymous17 to choose GREEN in the next round?</p> <img src = "A17_bg_co_res.png" height="200"></img>`,
        A17_gb_co_res_sl: `<p> How likely is Anonymous17 to choose GREEN in the next round?</p> <img src = "A17_gb_co_res.png" height="200"></img>`,
        A17_bb_co_res_sl: `<p> How likely is Anonymous17 to choose GREEN in the next round?</p> <img src = "A17_bb_co_res.png" height="200"></img>`,
        counter_green_coop_r1: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed. </p>",
        counter_blue_coop_r1: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed. </p>",
        counter_green_coop_r2: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 3. </p>" , 
        counter_blue_coop_r2: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 3. </p>",
        counter_green_defe_r2: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 3. </p>", 
        counter_blue_defe_r2: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 3. </p>",
        counter_green_coop_r3: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 4. </p>" , 
        counter_blue_coop_r3: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 4. </p>",
        counter_green_defe_r3: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 4. </p>", 
        counter_blue_defe_r3: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 4. </p>",
        counter_green_coop_r4: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 5. </p>" , 
        counter_blue_coop_r4: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 5. </p>",
        counter_green_defe_r4: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 5. </p>", 
        counter_blue_defe_r4: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 5. </p>",
        counter_green_coop_r5: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 6. </p>" , 
        counter_blue_coop_r5: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 6. </p>",
        counter_green_defe_r5: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 6. </p>", 
        counter_blue_defe_r5: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 6. </p>",
        counter_green_coop_r6: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 7. </p>" , 
        counter_blue_coop_r6: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 7. </p>",
        counter_green_defe_r6: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 7. </p>", 
        counter_green_coop_r6: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>GREEN</strong>. You <strong>each</strong> received <strong>5 points</strong>. Press any key to proceed to Round 7. </p>" , 
        counter_blue_coop_r7: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 8. </p>",
        counter_green_defe_r7: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 8. </p>", 
        counter_blue_defe_r7: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 8. </p>",
        counter_blue_defe_r7: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 8. </p>",
        counter_blue_coop_r8: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 9. </p>",
        counter_green_defe_r8: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 9. </p>", 
        counter_blue_defe_r8: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 9. </p>",
        counter_blue_defe_r8: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 9. </p>",
        counter_blue_coop_r9: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 10. </p>",
        counter_green_defe_r9: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 10. </p>", 
        counter_blue_defe_r9: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 10. </p>",
        counter_blue_defe_r9: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 10. </p>",
        counter_blue_coop_r10: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 11. </p>",
        counter_green_defe_r10: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 11. </p>", 
        counter_blue_defe_r10: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 11. </p>",
        counter_blue_defe_r10: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 11. </p>",
        counter_blue_coop_r11: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 12. </p>",
        counter_green_defe_r11: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 12. </p>", 
        counter_blue_defe_r11: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 12. </p>",
        counter_blue_defe_r11: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 12. </p>",
        counter_blue_coop_r12: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 13. </p>",
        counter_green_defe_r12: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 13. </p>", 
        counter_blue_defe_r12: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 13. </p>",
        counter_blue_defe_r12: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 13. </p>",
        counter_blue_coop_r13: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 14. </p>",
        counter_green_defe_r13: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 14. </p>", 
        counter_blue_defe_r13: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 14. </p>",
        counter_blue_defe_r13: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 14. </p>",
        counter_blue_coop_r14: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 15. </p>",
        counter_green_defe_r14: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 15. </p>", 
        counter_blue_defe_r14: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 15. </p>",
        counter_blue_defe_r14: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 15. </p>",
        counter_blue_coop_r15: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 16. </p>",
        counter_green_defe_r15: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 16. </p>", 
        counter_blue_defe_r15: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 16. </p>",
        counter_blue_defe_r15: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 16. </p>",
        counter_blue_coop_r16: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 17. </p>",
        counter_green_defe_r16: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 17. </p>", 
        counter_blue_defe_r16: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 17. </p>",
        counter_blue_defe_r16: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 17. </p>",
        counter_blue_coop_r17: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 18. </p>",
        counter_green_defe_r17: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 18. </p>", 
        counter_blue_defe_r17: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 18. </p>",
        counter_blue_defe_r17: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 18. </p>",
        counter_blue_coop_r18: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 19. </p>",
        counter_green_defe_r18: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 19. </p>", 
        counter_blue_defe_r18: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 19. </p>",
        counter_blue_defe_r18: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 19. </p>",
        counter_blue_coop_r19: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed to Round 20. </p>",
        counter_green_defe_r19: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed to Round 20. </p>", 
        counter_blue_defe_r19: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 20. </p>",
        counter_blue_defe_r19: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed to Round 20. </p>",
        counter_blue_coop_r20: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>GREEN</strong>. You received <strong>7 points</strong>. Anonymous17 received <strong>2 points</strong>. Press any key to proceed. </p>",
        counter_green_defe_r20: "<p> You chose <strong>GREEN</strong>. Anonymous17 chose <strong>BLUE</strong>. You received <strong>2 points</strong>. Anonymous17 received <strong>7 points</strong>. Press any key to proceed. </p>", 
        counter_blue_defe_r20: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed. </p>",
        counter_blue_defe_r20: "<p> You chose <strong>BLUE</strong>. Anonymous17 chose <strong>BLUE</strong>. You <strong>each</strong> received <strong>3 points</strong>. Press any key to proceed. </p>"
        }
    ]
}


var likert_scale = [
  "True", 
  "Somewhat true", 
  "Somewhat false", 
  "False" 
]

var likert_trial = {
  type: 'survey-likert',
  questions: [
    {prompt: "I’m optimistic more often than not.", name: 'TriPM_1', labels: likert_scale},
    {prompt: "How other people feel is important to me.", name: 'TriPM_2', labels: likert_scale},
    {prompt: "I often act on immediate needs.", name: 'TriPM_3', labels: likert_scale},
  ],
  randomize_question_order: true
}

var debrief = {
  type: 'html-keyboard-response', 
  stimulus: '<p>End of experiment.</p>'
}

jsPsych.init({
  timeline: [ instr, adfes_practice_procedure, adfes_test_procedure, ipd_intro_c0, ipd_connect_c0, ipd_anony_c0, ipd_charac_dec_c0, ipd_charac_par_anim, ipd_charac_par, 
    ipd_charac_A35_anim, ipd_charac_A35, ipd_instr_c0, ipd_connect_c0, ipd_c0_co_procedure, ipd_intro_c1, ipd_connect_c0, ipd_anony_c1, ipd_charac_dec_c1, 
    ipd_charac_A17_anim, ipd_charac_A17, ipd_instr_c1, ipd_connect_c1, likert_trial, debrief
  ]
})
