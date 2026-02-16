import gleam/dict
import gleam/dynamic/decode
import gleam/json
import gleam/option.{type Option, None}
import oas/generator/utils

pub type TranscriptOptionalParams {
  TranscriptOptionalParams(
    language_detection: Option(Bool),
    disfluencies: Option(Bool),
    language_confidence_threshold: Option(Float),
    redact_pii_policies: Option(List(PiiPolicy)),
    redact_pii_sub: Option(utils.Any),
    summary_type: Option(SummaryType),
    redact_pii: Option(Bool),
    custom_topics: Option(Bool),
    content_safety_confidence: Option(Int),
    iab_categories: Option(Bool),
    summarization: Option(Bool),
    boost_param: Option(TranscriptBoostParam),
    audio_start_from: Option(Int),
    summary_model: Option(SummaryModel),
    webhook_auth_header_value: Option(String),
    word_boost: Option(List(String)),
    webhook_auth_header_name: Option(String),
    speech_threshold: Option(Float),
    speech_model: Option(utils.Any),
    sentiment_analysis: Option(Bool),
    redact_pii_audio_quality: Option(RedactPiiAudioQuality),
    entity_detection: Option(Bool),
    redact_pii_audio: Option(Bool),
    prompt: Option(String),
    topics: Option(List(String)),
    audio_end_at: Option(Int),
    dual_channel: Option(Bool),
    speaker_labels: Option(Bool),
    keyterms_prompt: Option(List(String)),
    content_safety: Option(Bool),
    punctuate: Option(Bool),
    auto_chapters: Option(Bool),
    format_text: Option(Bool),
    language_code: Option(utils.Any),
    auto_highlights: Option(Bool),
    multichannel: Option(Bool),
    custom_spelling: Option(List(TranscriptCustomSpelling)),
    webhook_url: Option(String),
    speakers_expected: Option(Int),
    filter_profanity: Option(Bool),
  )
}

pub type UploadedFile {
  UploadedFile(upload_url: String)
}

pub type TranscriptUtterance {
  TranscriptUtterance(
    speaker: String,
    end: Int,
    text: String,
    confidence: Float,
    words: List(TranscriptWord),
    channel: Option(String),
    start: Int,
  )
}

pub type ListTranscriptParams {
  ListTranscriptParams(
    limit: Option(Int),
    before_id: Option(String),
    after_id: Option(String),
    created_on: Option(String),
    status: Option(TranscriptStatus),
    throttled_only: Option(Bool),
  )
}

pub type TranscriptParagraph {
  TranscriptParagraph(
    end: Int,
    text: String,
    confidence: Float,
    words: List(TranscriptWord),
    start: Int,
  )
}

pub type TranscriptReadyNotification {
  TranscriptReadyNotification(
    status: TranscriptReadyStatus,
    transcript_id: String,
  )
}

pub type RedactedAudioResponse {
  RedactedAudioResponse(status: RedactedAudioStatus, redacted_audio_url: String)
}

pub type LemurQuestion {
  LemurQuestion(
    answer_options: Option(List(String)),
    answer_format: Option(String),
    context: Option(utils.Any),
    question: String,
  )
}

pub type Transcript {
  Transcript(
    language_detection: Option(Bool),
    disfluencies: Option(Bool),
    audio_duration: Option(Int),
    language_confidence_threshold: Option(Float),
    redact_pii_policies: Option(List(PiiPolicy)),
    keyterms_prompt: Option(List(String)),
    id: String,
    redact_pii_sub: Option(SubstitutionPolicy),
    summary_type: Option(String),
    status: TranscriptStatus,
    redact_pii: Bool,
    custom_topics: Option(Bool),
    webhook_status_code: Option(Int),
    language_confidence: Option(Float),
    summarization: Bool,
    iab_categories: Option(Bool),
    boost_param: Option(String),
    webhook_auth: Bool,
    audio_start_from: Option(Int),
    summary_model: Option(String),
    word_boost: Option(List(String)),
    webhook_auth_header_name: Option(String),
    speech_threshold: Option(Float),
    auto_highlights_result: Option(utils.Any),
    text: Option(String),
    acoustic_model: String,
    speech_model: utils.Any,
    sentiment_analysis: Option(Bool),
    speed_boost: Option(Bool),
    iab_categories_result: Option(utils.Any),
    confidence: Option(Float),
    multichannel: Option(Bool),
    redact_pii_audio_quality: Option(utils.Any),
    words: Option(List(TranscriptWord)),
    entity_detection: Option(Bool),
    redact_pii_audio: Option(Bool),
    custom_spelling: Option(List(TranscriptCustomSpelling)),
    error: Option(String),
    summary: Option(String),
    chapters: Option(List(Chapter)),
    audio_url: String,
    content_safety_labels: Option(utils.Any),
    prompt: Option(String),
    topics: Option(List(String)),
    sentiment_analysis_results: Option(List(SentimentAnalysisResult)),
    speakers_expected: Option(Int),
    language_model: String,
    utterances: Option(List(TranscriptUtterance)),
    entities: Option(List(Entity)),
    filter_profanity: Option(Bool),
    audio_end_at: Option(Int),
    dual_channel: Option(Bool),
    speaker_labels: Option(Bool),
    throttled: Option(Bool),
    audio_channels: Option(Int),
    content_safety: Option(Bool),
    punctuate: Option(Bool),
    auto_chapters: Option(Bool),
    format_text: Option(Bool),
    language_code: Option(utils.Any),
    auto_highlights: Bool,
    webhook_url: Option(String),
  )
}

pub type Timestamp {
  Timestamp(end: Int, start: Int)
}

pub type CreateRealtimeTemporaryTokenParams {
  CreateRealtimeTemporaryTokenParams(expires_in: Int)
}

pub type LemurQuestionAnswer {
  LemurQuestionAnswer(answer: String, question: String)
}

pub type PurgeLemurRequestDataResponse {
  PurgeLemurRequestDataResponse(
    request_id_to_purge: String,
    deleted: Bool,
    request_id: String,
  )
}

pub type RealtimeTemporaryTokenResponse {
  RealtimeTemporaryTokenResponse(token_: String)
}

pub type TranscriptList {
  TranscriptList(
    transcripts: List(TranscriptListItem),
    page_details: PageDetails,
  )
}

pub type WordSearchResponse {
  WordSearchResponse(
    id: String,
    total_count: Int,
    matches: List(WordSearchMatch),
  )
}

pub type WordSearchMatch {
  WordSearchMatch(
    timestamps: List(WordSearchTimestamp),
    count: Int,
    text: String,
    indexes: List(Int),
  )
}

pub type TopicDetectionResult {
  TopicDetectionResult(
    labels: Option(List(Anon93e14bd9)),
    timestamp: Option(Timestamp),
    text: String,
  )
}

pub type PageDetails {
  PageDetails(
    next_url: Option(String),
    prev_url: Option(String),
    limit: Int,
    result_count: Int,
    current_url: String,
  )
}

pub type SentencesResponse {
  SentencesResponse(
    audio_duration: Float,
    id: String,
    sentences: List(TranscriptSentence),
    confidence: Float,
  )
}

pub type SeverityScoreSummary {
  SeverityScoreSummary(medium: Float, low: Float, high: Float)
}

pub type TopicDetectionModelResult {
  TopicDetectionModelResult(
    results: List(TopicDetectionResult),
    status: AudioIntelligenceModelStatus,
    summary: dict.Dict(String, Float),
  )
}

pub type LemurUsage {
  LemurUsage(output_tokens: Int, input_tokens: Int)
}

pub type LemurBaseParams {
  LemurBaseParams(
    transcript_ids: Option(List(String)),
    context: Option(utils.Any),
    temperature: Option(Float),
    max_output_size: Option(Int),
    input_text: Option(String),
    final_model: utils.Any,
  )
}

pub type Error {
  Error(
    status: Option(String),
    error: String,
    additional_properties: dict.Dict(String, utils.Any),
  )
}

pub type SentimentAnalysisResult {
  SentimentAnalysisResult(
    speaker: Option(String),
    end: Int,
    sentiment: Sentiment,
    text: String,
    confidence: Float,
    channel: Option(String),
    start: Int,
  )
}

pub type TranscriptListItem {
  TranscriptListItem(
    created: String,
    error: Option(String),
    resource_url: String,
    id: String,
    status: TranscriptStatus,
    completed: Option(String),
    audio_url: String,
  )
}

pub type ContentSafetyLabelsResult {
  ContentSafetyLabelsResult(
    severity_score_summary: dict.Dict(String, SeverityScoreSummary),
    results: List(ContentSafetyLabelResult),
    status: AudioIntelligenceModelStatus,
    summary: dict.Dict(String, Float),
  )
}

pub type ContentSafetyLabelResult {
  ContentSafetyLabelResult(
    labels: List(ContentSafetyLabel),
    timestamp: Timestamp,
    sentences_idx_start: Int,
    text: String,
    sentences_idx_end: Int,
  )
}

pub type ParagraphsResponse {
  ParagraphsResponse(
    audio_duration: Float,
    id: String,
    confidence: Float,
    paragraphs: List(TranscriptParagraph),
  )
}

pub type LemurBaseResponse {
  LemurBaseResponse(request_id: String, usage: LemurUsage)
}

pub type Entity {
  Entity(end: Int, entity_type: EntityType, text: String, start: Int)
}

pub type AutoHighlightResult {
  AutoHighlightResult(
    timestamps: List(Timestamp),
    count: Int,
    text: String,
    rank: Float,
  )
}

pub type TranscriptCustomSpelling {
  TranscriptCustomSpelling(to: String, from: List(String))
}

pub type TranscriptWord {
  TranscriptWord(
    speaker: Option(String),
    end: Int,
    text: String,
    confidence: Float,
    channel: Option(String),
    start: Int,
  )
}

pub type TranscriptSentence {
  TranscriptSentence(
    speaker: Option(String),
    end: Int,
    text: String,
    confidence: Float,
    words: List(TranscriptWord),
    channel: Option(String),
    start: Int,
  )
}

pub type Chapter {
  Chapter(end: Int, headline: String, summary: String, gist: String, start: Int)
}

pub type AutoHighlightsResult {
  AutoHighlightsResult(
    results: List(AutoHighlightResult),
    status: AudioIntelligenceModelStatus,
  )
}

pub type ContentSafetyLabel {
  ContentSafetyLabel(severity: Float, label: String, confidence: Float)
}

pub type Anon93e14bd9 {
  Anon93e14bd9(relevance: Float, label: String)
}

pub type LemurActionItemsParams =
  Nil

pub type TranscriptReadyStatus =
  String

pub type LemurTaskParams =
  Nil

pub type TranscriptParams =
  dict.Dict(String, utils.Never)

pub type LemurQuestionAnswerParams =
  Nil

pub type LemurSummaryParams =
  Nil

pub type TranscriptLanguageCode =
  String

pub type LemurActionItemsResponse =
  Nil

pub type LemurModel =
  String

pub type RedactPiiAudioQuality =
  String

pub type LemurTaskResponse =
  Nil

pub type LemurSummaryResponse =
  Nil

pub type LemurQuestionAnswerResponse =
  Nil

pub type SubstitutionPolicy =
  String

pub type SubtitleFormat =
  String

pub type Sentiment =
  String

pub type TranscriptStatus =
  String

pub type RedactedAudioStatus =
  String

pub type SpeechModel =
  String

pub type AudioIntelligenceModelStatus =
  String

pub type SummaryModel =
  String

pub type LemurStringResponse =
  Nil

pub type PiiPolicy =
  String

pub type RedactedAudioNotification =
  dict.Dict(String, utils.Never)

pub type SummaryType =
  String

pub type TranscriptBoostParam =
  String

pub type EntityType =
  String

pub type LemurResponse =
  Nil

pub type TranscriptWebhookNotification =
  dict.Dict(String, utils.Never)

pub type WordSearchTimestamp =
  List(Int)

pub fn anon_93e14bd9_decoder() {
  use relevance <- decode.field("relevance", decode.float)
  use label <- decode.field("label", decode.string)
  decode.success(Anon93e14bd9(relevance: relevance, label: label))
}

pub fn anon_93e14bd9_encode(data: Anon93e14bd9) {
  utils.object([
    #("relevance", json.float(data.relevance)),
    #("label", json.string(data.label)),
  ])
}

pub fn word_search_timestamp_decoder() {
  decode.list(decode.int)
}

pub fn word_search_timestamp_encode(data: WordSearchTimestamp) {
  json.array(data, json.int)
}

pub fn content_safety_label_decoder() {
  use severity <- decode.field("severity", decode.float)
  use label <- decode.field("label", decode.string)
  use confidence <- decode.field("confidence", decode.float)
  decode.success(ContentSafetyLabel(
    severity: severity,
    label: label,
    confidence: confidence,
  ))
}

pub fn content_safety_label_encode(data: ContentSafetyLabel) {
  utils.object([
    #("severity", json.float(data.severity)),
    #("label", json.string(data.label)),
    #("confidence", json.float(data.confidence)),
  ])
}

pub fn auto_highlights_result_decoder() {
  use results <- decode.field(
    "results",
    decode.list(auto_highlight_result_decoder()),
  )
  use status <- decode.field(
    "status",
    audio_intelligence_model_status_decoder(),
  )
  decode.success(AutoHighlightsResult(results: results, status: status))
}

pub fn auto_highlights_result_encode(data: AutoHighlightsResult) {
  utils.object([
    #("results", json.array(_, auto_highlight_result_encode)(data.results)),
    #("status", audio_intelligence_model_status_encode(data.status)),
  ])
}

pub fn transcript_webhook_notification_decoder() {
  decode.dict(
    decode.string,
    decode.new_primitive_decoder("Never", fn(_) {
      panic as "tried to decode a never decode value"
    }),
  )
}

pub fn transcript_webhook_notification_encode(
  data: TranscriptWebhookNotification,
) {
  utils.dict(data, fn(_data) { panic as "never value cannot be encoded" })
}

pub fn chapter_decoder() {
  use end <- decode.field("end", decode.int)
  use headline <- decode.field("headline", decode.string)
  use summary <- decode.field("summary", decode.string)
  use gist <- decode.field("gist", decode.string)
  use start <- decode.field("start", decode.int)
  decode.success(Chapter(
    end: end,
    headline: headline,
    summary: summary,
    gist: gist,
    start: start,
  ))
}

pub fn chapter_encode(data: Chapter) {
  utils.object([
    #("end", json.int(data.end)),
    #("headline", json.string(data.headline)),
    #("summary", json.string(data.summary)),
    #("gist", json.string(data.gist)),
    #("start", json.int(data.start)),
  ])
}

pub fn lemur_response_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_response_encode(_data: LemurResponse) {
  json.null()
}

pub fn transcript_sentence_decoder() {
  use speaker <- decode.optional_field(
    "speaker",
    None,
    decode.optional(decode.string),
  )
  use end <- decode.field("end", decode.int)
  use text <- decode.field("text", decode.string)
  use confidence <- decode.field("confidence", decode.float)
  use words <- decode.field("words", decode.list(transcript_word_decoder()))
  use channel <- decode.optional_field(
    "channel",
    None,
    decode.optional(decode.string),
  )
  use start <- decode.field("start", decode.int)
  decode.success(TranscriptSentence(
    speaker: speaker,
    end: end,
    text: text,
    confidence: confidence,
    words: words,
    channel: channel,
    start: start,
  ))
}

pub fn transcript_sentence_encode(data: TranscriptSentence) {
  utils.object([
    #("speaker", json.nullable(data.speaker, json.string)),
    #("end", json.int(data.end)),
    #("text", json.string(data.text)),
    #("confidence", json.float(data.confidence)),
    #("words", json.array(_, transcript_word_encode)(data.words)),
    #("channel", json.nullable(data.channel, json.string)),
    #("start", json.int(data.start)),
  ])
}

pub fn entity_type_decoder() {
  decode.string
}

pub fn entity_type_encode(data: EntityType) {
  json.string(data)
}

pub fn transcript_word_decoder() {
  use speaker <- decode.optional_field(
    "speaker",
    None,
    decode.optional(decode.string),
  )
  use end <- decode.field("end", decode.int)
  use text <- decode.field("text", decode.string)
  use confidence <- decode.field("confidence", decode.float)
  use channel <- decode.optional_field(
    "channel",
    None,
    decode.optional(decode.string),
  )
  use start <- decode.field("start", decode.int)
  decode.success(TranscriptWord(
    speaker: speaker,
    end: end,
    text: text,
    confidence: confidence,
    channel: channel,
    start: start,
  ))
}

pub fn transcript_word_encode(data: TranscriptWord) {
  utils.object([
    #("speaker", json.nullable(data.speaker, json.string)),
    #("end", json.int(data.end)),
    #("text", json.string(data.text)),
    #("confidence", json.float(data.confidence)),
    #("channel", json.nullable(data.channel, json.string)),
    #("start", json.int(data.start)),
  ])
}

pub fn transcript_boost_param_decoder() {
  decode.string
}

pub fn transcript_boost_param_encode(data: TranscriptBoostParam) {
  json.string(data)
}

pub fn summary_type_decoder() {
  decode.string
}

pub fn summary_type_encode(data: SummaryType) {
  json.string(data)
}

pub fn redacted_audio_notification_decoder() {
  decode.dict(
    decode.string,
    decode.new_primitive_decoder("Never", fn(_) {
      panic as "tried to decode a never decode value"
    }),
  )
}

pub fn redacted_audio_notification_encode(data: RedactedAudioNotification) {
  utils.dict(data, fn(_data) { panic as "never value cannot be encoded" })
}

pub fn transcript_custom_spelling_decoder() {
  use to <- decode.field("to", decode.string)
  use from <- decode.field("from", decode.list(decode.string))
  decode.success(TranscriptCustomSpelling(to: to, from: from))
}

pub fn transcript_custom_spelling_encode(data: TranscriptCustomSpelling) {
  utils.object([
    #("to", json.string(data.to)),
    #("from", json.array(_, json.string)(data.from)),
  ])
}

pub fn auto_highlight_result_decoder() {
  use timestamps <- decode.field("timestamps", decode.list(timestamp_decoder()))
  use count <- decode.field("count", decode.int)
  use text <- decode.field("text", decode.string)
  use rank <- decode.field("rank", decode.float)
  decode.success(AutoHighlightResult(
    timestamps: timestamps,
    count: count,
    text: text,
    rank: rank,
  ))
}

pub fn auto_highlight_result_encode(data: AutoHighlightResult) {
  utils.object([
    #("timestamps", json.array(_, timestamp_encode)(data.timestamps)),
    #("count", json.int(data.count)),
    #("text", json.string(data.text)),
    #("rank", json.float(data.rank)),
  ])
}

pub fn pii_policy_decoder() {
  decode.string
}

pub fn pii_policy_encode(data: PiiPolicy) {
  json.string(data)
}

pub fn entity_decoder() {
  use end <- decode.field("end", decode.int)
  use entity_type <- decode.field("entity_type", entity_type_decoder())
  use text <- decode.field("text", decode.string)
  use start <- decode.field("start", decode.int)
  decode.success(Entity(
    end: end,
    entity_type: entity_type,
    text: text,
    start: start,
  ))
}

pub fn entity_encode(data: Entity) {
  utils.object([
    #("end", json.int(data.end)),
    #("entity_type", entity_type_encode(data.entity_type)),
    #("text", json.string(data.text)),
    #("start", json.int(data.start)),
  ])
}

pub fn lemur_base_response_decoder() {
  use request_id <- decode.field("request_id", decode.string)
  use usage <- decode.field("usage", lemur_usage_decoder())
  decode.success(LemurBaseResponse(request_id: request_id, usage: usage))
}

pub fn lemur_base_response_encode(data: LemurBaseResponse) {
  utils.object([
    #("request_id", json.string(data.request_id)),
    #("usage", lemur_usage_encode(data.usage)),
  ])
}

pub fn lemur_string_response_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_string_response_encode(_data: LemurStringResponse) {
  json.null()
}

pub fn summary_model_decoder() {
  decode.string
}

pub fn summary_model_encode(data: SummaryModel) {
  json.string(data)
}

pub fn paragraphs_response_decoder() {
  use audio_duration <- decode.field("audio_duration", decode.float)
  use id <- decode.field("id", decode.string)
  use confidence <- decode.field("confidence", decode.float)
  use paragraphs <- decode.field(
    "paragraphs",
    decode.list(transcript_paragraph_decoder()),
  )
  decode.success(ParagraphsResponse(
    audio_duration: audio_duration,
    id: id,
    confidence: confidence,
    paragraphs: paragraphs,
  ))
}

pub fn paragraphs_response_encode(data: ParagraphsResponse) {
  utils.object([
    #("audio_duration", json.float(data.audio_duration)),
    #("id", json.string(data.id)),
    #("confidence", json.float(data.confidence)),
    #("paragraphs", json.array(_, transcript_paragraph_encode)(data.paragraphs)),
  ])
}

pub fn content_safety_label_result_decoder() {
  use labels <- decode.field(
    "labels",
    decode.list(content_safety_label_decoder()),
  )
  use timestamp <- decode.field("timestamp", timestamp_decoder())
  use sentences_idx_start <- decode.field("sentences_idx_start", decode.int)
  use text <- decode.field("text", decode.string)
  use sentences_idx_end <- decode.field("sentences_idx_end", decode.int)
  decode.success(ContentSafetyLabelResult(
    labels: labels,
    timestamp: timestamp,
    sentences_idx_start: sentences_idx_start,
    text: text,
    sentences_idx_end: sentences_idx_end,
  ))
}

pub fn content_safety_label_result_encode(data: ContentSafetyLabelResult) {
  utils.object([
    #("labels", json.array(_, content_safety_label_encode)(data.labels)),
    #("timestamp", timestamp_encode(data.timestamp)),
    #("sentences_idx_start", json.int(data.sentences_idx_start)),
    #("text", json.string(data.text)),
    #("sentences_idx_end", json.int(data.sentences_idx_end)),
  ])
}

pub fn audio_intelligence_model_status_decoder() {
  decode.string
}

pub fn audio_intelligence_model_status_encode(
  data: AudioIntelligenceModelStatus,
) {
  json.string(data)
}

pub fn content_safety_labels_result_decoder() {
  use severity_score_summary <- decode.field(
    "severity_score_summary",
    decode.dict(decode.string, severity_score_summary_decoder()),
  )
  use results <- decode.field(
    "results",
    decode.list(content_safety_label_result_decoder()),
  )
  use status <- decode.field(
    "status",
    audio_intelligence_model_status_decoder(),
  )
  use summary <- decode.field(
    "summary",
    decode.dict(decode.string, decode.float),
  )
  decode.success(ContentSafetyLabelsResult(
    severity_score_summary: severity_score_summary,
    results: results,
    status: status,
    summary: summary,
  ))
}

pub fn content_safety_labels_result_encode(data: ContentSafetyLabelsResult) {
  utils.object([
    #(
      "severity_score_summary",
      utils.dict(_, severity_score_summary_encode)(data.severity_score_summary),
    ),
    #(
      "results",
      json.array(_, content_safety_label_result_encode)(data.results),
    ),
    #("status", audio_intelligence_model_status_encode(data.status)),
    #("summary", utils.dict(_, json.float)(data.summary)),
  ])
}

pub fn transcript_list_item_decoder() {
  use created <- decode.field("created", decode.string)
  use error <- decode.optional_field(
    "error",
    None,
    decode.optional(decode.string),
  )
  use resource_url <- decode.field("resource_url", decode.string)
  use id <- decode.field("id", decode.string)
  use status <- decode.field("status", transcript_status_decoder())
  use completed <- decode.optional_field(
    "completed",
    None,
    decode.optional(decode.string),
  )
  use audio_url <- decode.field("audio_url", decode.string)
  decode.success(TranscriptListItem(
    created: created,
    error: error,
    resource_url: resource_url,
    id: id,
    status: status,
    completed: completed,
    audio_url: audio_url,
  ))
}

pub fn transcript_list_item_encode(data: TranscriptListItem) {
  utils.object([
    #("created", json.string(data.created)),
    #("error", json.nullable(data.error, json.string)),
    #("resource_url", json.string(data.resource_url)),
    #("id", json.string(data.id)),
    #("status", transcript_status_encode(data.status)),
    #("completed", json.nullable(data.completed, json.string)),
    #("audio_url", json.string(data.audio_url)),
  ])
}

pub fn speech_model_decoder() {
  decode.string
}

pub fn speech_model_encode(data: SpeechModel) {
  json.string(data)
}

pub fn redacted_audio_status_decoder() {
  decode.string
}

pub fn redacted_audio_status_encode(data: RedactedAudioStatus) {
  json.string(data)
}

pub fn sentiment_analysis_result_decoder() {
  use speaker <- decode.optional_field(
    "speaker",
    None,
    decode.optional(decode.string),
  )
  use end <- decode.field("end", decode.int)
  use sentiment <- decode.field("sentiment", sentiment_decoder())
  use text <- decode.field("text", decode.string)
  use confidence <- decode.field("confidence", decode.float)
  use channel <- decode.optional_field(
    "channel",
    None,
    decode.optional(decode.string),
  )
  use start <- decode.field("start", decode.int)
  decode.success(SentimentAnalysisResult(
    speaker: speaker,
    end: end,
    sentiment: sentiment,
    text: text,
    confidence: confidence,
    channel: channel,
    start: start,
  ))
}

pub fn sentiment_analysis_result_encode(data: SentimentAnalysisResult) {
  utils.object([
    #("speaker", json.nullable(data.speaker, json.string)),
    #("end", json.int(data.end)),
    #("sentiment", sentiment_encode(data.sentiment)),
    #("text", json.string(data.text)),
    #("confidence", json.float(data.confidence)),
    #("channel", json.nullable(data.channel, json.string)),
    #("start", json.int(data.start)),
  ])
}

pub fn error_decoder() {
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use error <- decode.field("error", decode.string)
  use additional_properties <- utils.decode_additional(
    ["status", "error"],
    utils.any_decoder(),
  )
  decode.success(Error(
    status: status,
    error: error,
    additional_properties: additional_properties,
  ))
}

pub fn error_encode(data: Error) {
  utils.object([
    #("status", json.nullable(data.status, json.string)),
    #("error", json.string(data.error)),
    ..dict.to_list(
      dict.map_values(data.additional_properties, fn(_key, value) {
        utils.any_to_json(value)
      }),
    )
  ])
}

pub fn lemur_base_params_decoder() {
  use transcript_ids <- decode.optional_field(
    "transcript_ids",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use context <- decode.optional_field(
    "context",
    None,
    decode.optional(utils.any_decoder()),
  )
  use temperature <- decode.optional_field(
    "temperature",
    None,
    decode.optional(decode.float),
  )
  use max_output_size <- decode.optional_field(
    "max_output_size",
    None,
    decode.optional(decode.int),
  )
  use input_text <- decode.optional_field(
    "input_text",
    None,
    decode.optional(decode.string),
  )
  use final_model <- decode.field("final_model", utils.any_decoder())
  decode.success(LemurBaseParams(
    transcript_ids: transcript_ids,
    context: context,
    temperature: temperature,
    max_output_size: max_output_size,
    input_text: input_text,
    final_model: final_model,
  ))
}

pub fn lemur_base_params_encode(data: LemurBaseParams) {
  utils.object([
    #(
      "transcript_ids",
      json.nullable(data.transcript_ids, json.array(_, json.string)),
    ),
    #("context", json.nullable(data.context, utils.any_to_json)),
    #("temperature", json.nullable(data.temperature, json.float)),
    #("max_output_size", json.nullable(data.max_output_size, json.int)),
    #("input_text", json.nullable(data.input_text, json.string)),
    #("final_model", utils.any_to_json(data.final_model)),
  ])
}

pub fn transcript_status_decoder() {
  decode.string
}

pub fn transcript_status_encode(data: TranscriptStatus) {
  json.string(data)
}

pub fn sentiment_decoder() {
  decode.string
}

pub fn sentiment_encode(data: Sentiment) {
  json.string(data)
}

pub fn subtitle_format_decoder() {
  decode.string
}

pub fn subtitle_format_encode(data: SubtitleFormat) {
  json.string(data)
}

pub fn substitution_policy_decoder() {
  decode.string
}

pub fn substitution_policy_encode(data: SubstitutionPolicy) {
  json.string(data)
}

pub fn lemur_usage_decoder() {
  use output_tokens <- decode.field("output_tokens", decode.int)
  use input_tokens <- decode.field("input_tokens", decode.int)
  decode.success(LemurUsage(
    output_tokens: output_tokens,
    input_tokens: input_tokens,
  ))
}

pub fn lemur_usage_encode(data: LemurUsage) {
  utils.object([
    #("output_tokens", json.int(data.output_tokens)),
    #("input_tokens", json.int(data.input_tokens)),
  ])
}

pub fn topic_detection_model_result_decoder() {
  use results <- decode.field(
    "results",
    decode.list(topic_detection_result_decoder()),
  )
  use status <- decode.field(
    "status",
    audio_intelligence_model_status_decoder(),
  )
  use summary <- decode.field(
    "summary",
    decode.dict(decode.string, decode.float),
  )
  decode.success(TopicDetectionModelResult(
    results: results,
    status: status,
    summary: summary,
  ))
}

pub fn topic_detection_model_result_encode(data: TopicDetectionModelResult) {
  utils.object([
    #("results", json.array(_, topic_detection_result_encode)(data.results)),
    #("status", audio_intelligence_model_status_encode(data.status)),
    #("summary", utils.dict(_, json.float)(data.summary)),
  ])
}

pub fn severity_score_summary_decoder() {
  use medium <- decode.field("medium", decode.float)
  use low <- decode.field("low", decode.float)
  use high <- decode.field("high", decode.float)
  decode.success(SeverityScoreSummary(medium: medium, low: low, high: high))
}

pub fn severity_score_summary_encode(data: SeverityScoreSummary) {
  utils.object([
    #("medium", json.float(data.medium)),
    #("low", json.float(data.low)),
    #("high", json.float(data.high)),
  ])
}

pub fn sentences_response_decoder() {
  use audio_duration <- decode.field("audio_duration", decode.float)
  use id <- decode.field("id", decode.string)
  use sentences <- decode.field(
    "sentences",
    decode.list(transcript_sentence_decoder()),
  )
  use confidence <- decode.field("confidence", decode.float)
  decode.success(SentencesResponse(
    audio_duration: audio_duration,
    id: id,
    sentences: sentences,
    confidence: confidence,
  ))
}

pub fn sentences_response_encode(data: SentencesResponse) {
  utils.object([
    #("audio_duration", json.float(data.audio_duration)),
    #("id", json.string(data.id)),
    #("sentences", json.array(_, transcript_sentence_encode)(data.sentences)),
    #("confidence", json.float(data.confidence)),
  ])
}

pub fn page_details_decoder() {
  use next_url <- decode.optional_field(
    "next_url",
    None,
    decode.optional(decode.string),
  )
  use prev_url <- decode.optional_field(
    "prev_url",
    None,
    decode.optional(decode.string),
  )
  use limit <- decode.field("limit", decode.int)
  use result_count <- decode.field("result_count", decode.int)
  use current_url <- decode.field("current_url", decode.string)
  decode.success(PageDetails(
    next_url: next_url,
    prev_url: prev_url,
    limit: limit,
    result_count: result_count,
    current_url: current_url,
  ))
}

pub fn page_details_encode(data: PageDetails) {
  utils.object([
    #("next_url", json.nullable(data.next_url, json.string)),
    #("prev_url", json.nullable(data.prev_url, json.string)),
    #("limit", json.int(data.limit)),
    #("result_count", json.int(data.result_count)),
    #("current_url", json.string(data.current_url)),
  ])
}

pub fn topic_detection_result_decoder() {
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(anon_93e14bd9_decoder())),
  )
  use timestamp <- decode.optional_field(
    "timestamp",
    None,
    decode.optional(timestamp_decoder()),
  )
  use text <- decode.field("text", decode.string)
  decode.success(TopicDetectionResult(
    labels: labels,
    timestamp: timestamp,
    text: text,
  ))
}

pub fn topic_detection_result_encode(data: TopicDetectionResult) {
  utils.object([
    #("labels", json.nullable(data.labels, json.array(_, anon_93e14bd9_encode))),
    #("timestamp", json.nullable(data.timestamp, timestamp_encode)),
    #("text", json.string(data.text)),
  ])
}

pub fn word_search_match_decoder() {
  use timestamps <- decode.field(
    "timestamps",
    decode.list(word_search_timestamp_decoder()),
  )
  use count <- decode.field("count", decode.int)
  use text <- decode.field("text", decode.string)
  use indexes <- decode.field("indexes", decode.list(decode.int))
  decode.success(WordSearchMatch(
    timestamps: timestamps,
    count: count,
    text: text,
    indexes: indexes,
  ))
}

pub fn word_search_match_encode(data: WordSearchMatch) {
  utils.object([
    #(
      "timestamps",
      json.array(_, word_search_timestamp_encode)(data.timestamps),
    ),
    #("count", json.int(data.count)),
    #("text", json.string(data.text)),
    #("indexes", json.array(_, json.int)(data.indexes)),
  ])
}

pub fn word_search_response_decoder() {
  use id <- decode.field("id", decode.string)
  use total_count <- decode.field("total_count", decode.int)
  use matches <- decode.field(
    "matches",
    decode.list(word_search_match_decoder()),
  )
  decode.success(WordSearchResponse(
    id: id,
    total_count: total_count,
    matches: matches,
  ))
}

pub fn word_search_response_encode(data: WordSearchResponse) {
  utils.object([
    #("id", json.string(data.id)),
    #("total_count", json.int(data.total_count)),
    #("matches", json.array(_, word_search_match_encode)(data.matches)),
  ])
}

pub fn transcript_list_decoder() {
  use transcripts <- decode.field(
    "transcripts",
    decode.list(transcript_list_item_decoder()),
  )
  use page_details <- decode.field("page_details", page_details_decoder())
  decode.success(TranscriptList(
    transcripts: transcripts,
    page_details: page_details,
  ))
}

pub fn transcript_list_encode(data: TranscriptList) {
  utils.object([
    #(
      "transcripts",
      json.array(_, transcript_list_item_encode)(data.transcripts),
    ),
    #("page_details", page_details_encode(data.page_details)),
  ])
}

pub fn realtime_temporary_token_response_decoder() {
  use token_ <- decode.field("token", decode.string)
  decode.success(RealtimeTemporaryTokenResponse(token_: token_))
}

pub fn realtime_temporary_token_response_encode(
  data: RealtimeTemporaryTokenResponse,
) {
  utils.object([#("token", json.string(data.token_))])
}

pub fn purge_lemur_request_data_response_decoder() {
  use request_id_to_purge <- decode.field("request_id_to_purge", decode.string)
  use deleted <- decode.field("deleted", decode.bool)
  use request_id <- decode.field("request_id", decode.string)
  decode.success(PurgeLemurRequestDataResponse(
    request_id_to_purge: request_id_to_purge,
    deleted: deleted,
    request_id: request_id,
  ))
}

pub fn purge_lemur_request_data_response_encode(
  data: PurgeLemurRequestDataResponse,
) {
  utils.object([
    #("request_id_to_purge", json.string(data.request_id_to_purge)),
    #("deleted", json.bool(data.deleted)),
    #("request_id", json.string(data.request_id)),
  ])
}

pub fn lemur_question_answer_decoder() {
  use answer <- decode.field("answer", decode.string)
  use question <- decode.field("question", decode.string)
  decode.success(LemurQuestionAnswer(answer: answer, question: question))
}

pub fn lemur_question_answer_encode(data: LemurQuestionAnswer) {
  utils.object([
    #("answer", json.string(data.answer)),
    #("question", json.string(data.question)),
  ])
}

pub fn create_realtime_temporary_token_params_decoder() {
  use expires_in <- decode.field("expires_in", decode.int)
  decode.success(CreateRealtimeTemporaryTokenParams(expires_in: expires_in))
}

pub fn create_realtime_temporary_token_params_encode(
  data: CreateRealtimeTemporaryTokenParams,
) {
  utils.object([#("expires_in", json.int(data.expires_in))])
}

pub fn lemur_question_answer_response_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_question_answer_response_encode(_data: LemurQuestionAnswerResponse) {
  json.null()
}

pub fn timestamp_decoder() {
  use end <- decode.field("end", decode.int)
  use start <- decode.field("start", decode.int)
  decode.success(Timestamp(end: end, start: start))
}

pub fn timestamp_encode(data: Timestamp) {
  utils.object([#("end", json.int(data.end)), #("start", json.int(data.start))])
}

pub fn lemur_summary_response_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_summary_response_encode(_data: LemurSummaryResponse) {
  json.null()
}

pub fn transcript_decoder() {
  use language_detection <- decode.optional_field(
    "language_detection",
    None,
    decode.optional(decode.bool),
  )
  use disfluencies <- decode.optional_field(
    "disfluencies",
    None,
    decode.optional(decode.bool),
  )
  use audio_duration <- decode.optional_field(
    "audio_duration",
    None,
    decode.optional(decode.int),
  )
  use language_confidence_threshold <- decode.optional_field(
    "language_confidence_threshold",
    None,
    decode.optional(decode.float),
  )
  use redact_pii_policies <- decode.optional_field(
    "redact_pii_policies",
    None,
    decode.optional(decode.list(pii_policy_decoder())),
  )
  use keyterms_prompt <- decode.optional_field(
    "keyterms_prompt",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use id <- decode.field("id", decode.string)
  use redact_pii_sub <- decode.optional_field(
    "redact_pii_sub",
    None,
    decode.optional(substitution_policy_decoder()),
  )
  use summary_type <- decode.optional_field(
    "summary_type",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.field("status", transcript_status_decoder())
  use redact_pii <- decode.field("redact_pii", decode.bool)
  use custom_topics <- decode.optional_field(
    "custom_topics",
    None,
    decode.optional(decode.bool),
  )
  use webhook_status_code <- decode.optional_field(
    "webhook_status_code",
    None,
    decode.optional(decode.int),
  )
  use language_confidence <- decode.optional_field(
    "language_confidence",
    None,
    decode.optional(decode.float),
  )
  use summarization <- decode.field("summarization", decode.bool)
  use iab_categories <- decode.optional_field(
    "iab_categories",
    None,
    decode.optional(decode.bool),
  )
  use boost_param <- decode.optional_field(
    "boost_param",
    None,
    decode.optional(decode.string),
  )
  use webhook_auth <- decode.field("webhook_auth", decode.bool)
  use audio_start_from <- decode.optional_field(
    "audio_start_from",
    None,
    decode.optional(decode.int),
  )
  use summary_model <- decode.optional_field(
    "summary_model",
    None,
    decode.optional(decode.string),
  )
  use word_boost <- decode.optional_field(
    "word_boost",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use webhook_auth_header_name <- decode.optional_field(
    "webhook_auth_header_name",
    None,
    decode.optional(decode.string),
  )
  use speech_threshold <- decode.optional_field(
    "speech_threshold",
    None,
    decode.optional(decode.float),
  )
  use auto_highlights_result <- decode.optional_field(
    "auto_highlights_result",
    None,
    decode.optional(utils.any_decoder()),
  )
  use text <- decode.optional_field(
    "text",
    None,
    decode.optional(decode.string),
  )
  use acoustic_model <- decode.field("acoustic_model", decode.string)
  use speech_model <- decode.field("speech_model", utils.any_decoder())
  use sentiment_analysis <- decode.optional_field(
    "sentiment_analysis",
    None,
    decode.optional(decode.bool),
  )
  use speed_boost <- decode.optional_field(
    "speed_boost",
    None,
    decode.optional(decode.bool),
  )
  use iab_categories_result <- decode.optional_field(
    "iab_categories_result",
    None,
    decode.optional(utils.any_decoder()),
  )
  use confidence <- decode.optional_field(
    "confidence",
    None,
    decode.optional(decode.float),
  )
  use multichannel <- decode.optional_field(
    "multichannel",
    None,
    decode.optional(decode.bool),
  )
  use redact_pii_audio_quality <- decode.optional_field(
    "redact_pii_audio_quality",
    None,
    decode.optional(utils.any_decoder()),
  )
  use words <- decode.optional_field(
    "words",
    None,
    decode.optional(decode.list(transcript_word_decoder())),
  )
  use entity_detection <- decode.optional_field(
    "entity_detection",
    None,
    decode.optional(decode.bool),
  )
  use redact_pii_audio <- decode.optional_field(
    "redact_pii_audio",
    None,
    decode.optional(decode.bool),
  )
  use custom_spelling <- decode.optional_field(
    "custom_spelling",
    None,
    decode.optional(decode.list(transcript_custom_spelling_decoder())),
  )
  use error <- decode.optional_field(
    "error",
    None,
    decode.optional(decode.string),
  )
  use summary <- decode.optional_field(
    "summary",
    None,
    decode.optional(decode.string),
  )
  use chapters <- decode.optional_field(
    "chapters",
    None,
    decode.optional(decode.list(chapter_decoder())),
  )
  use audio_url <- decode.field("audio_url", decode.string)
  use content_safety_labels <- decode.optional_field(
    "content_safety_labels",
    None,
    decode.optional(utils.any_decoder()),
  )
  use prompt <- decode.optional_field(
    "prompt",
    None,
    decode.optional(decode.string),
  )
  use topics <- decode.optional_field(
    "topics",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use sentiment_analysis_results <- decode.optional_field(
    "sentiment_analysis_results",
    None,
    decode.optional(decode.list(sentiment_analysis_result_decoder())),
  )
  use speakers_expected <- decode.optional_field(
    "speakers_expected",
    None,
    decode.optional(decode.int),
  )
  use language_model <- decode.field("language_model", decode.string)
  use utterances <- decode.optional_field(
    "utterances",
    None,
    decode.optional(decode.list(transcript_utterance_decoder())),
  )
  use entities <- decode.optional_field(
    "entities",
    None,
    decode.optional(decode.list(entity_decoder())),
  )
  use filter_profanity <- decode.optional_field(
    "filter_profanity",
    None,
    decode.optional(decode.bool),
  )
  use audio_end_at <- decode.optional_field(
    "audio_end_at",
    None,
    decode.optional(decode.int),
  )
  use dual_channel <- decode.optional_field(
    "dual_channel",
    None,
    decode.optional(decode.bool),
  )
  use speaker_labels <- decode.optional_field(
    "speaker_labels",
    None,
    decode.optional(decode.bool),
  )
  use throttled <- decode.optional_field(
    "throttled",
    None,
    decode.optional(decode.bool),
  )
  use audio_channels <- decode.optional_field(
    "audio_channels",
    None,
    decode.optional(decode.int),
  )
  use content_safety <- decode.optional_field(
    "content_safety",
    None,
    decode.optional(decode.bool),
  )
  use punctuate <- decode.optional_field(
    "punctuate",
    None,
    decode.optional(decode.bool),
  )
  use auto_chapters <- decode.optional_field(
    "auto_chapters",
    None,
    decode.optional(decode.bool),
  )
  use format_text <- decode.optional_field(
    "format_text",
    None,
    decode.optional(decode.bool),
  )
  use language_code <- decode.optional_field(
    "language_code",
    None,
    decode.optional(utils.any_decoder()),
  )
  use auto_highlights <- decode.field("auto_highlights", decode.bool)
  use webhook_url <- decode.optional_field(
    "webhook_url",
    None,
    decode.optional(decode.string),
  )
  decode.success(Transcript(
    language_detection: language_detection,
    disfluencies: disfluencies,
    audio_duration: audio_duration,
    language_confidence_threshold: language_confidence_threshold,
    redact_pii_policies: redact_pii_policies,
    keyterms_prompt: keyterms_prompt,
    id: id,
    redact_pii_sub: redact_pii_sub,
    summary_type: summary_type,
    status: status,
    redact_pii: redact_pii,
    custom_topics: custom_topics,
    webhook_status_code: webhook_status_code,
    language_confidence: language_confidence,
    summarization: summarization,
    iab_categories: iab_categories,
    boost_param: boost_param,
    webhook_auth: webhook_auth,
    audio_start_from: audio_start_from,
    summary_model: summary_model,
    word_boost: word_boost,
    webhook_auth_header_name: webhook_auth_header_name,
    speech_threshold: speech_threshold,
    auto_highlights_result: auto_highlights_result,
    text: text,
    acoustic_model: acoustic_model,
    speech_model: speech_model,
    sentiment_analysis: sentiment_analysis,
    speed_boost: speed_boost,
    iab_categories_result: iab_categories_result,
    confidence: confidence,
    multichannel: multichannel,
    redact_pii_audio_quality: redact_pii_audio_quality,
    words: words,
    entity_detection: entity_detection,
    redact_pii_audio: redact_pii_audio,
    custom_spelling: custom_spelling,
    error: error,
    summary: summary,
    chapters: chapters,
    audio_url: audio_url,
    content_safety_labels: content_safety_labels,
    prompt: prompt,
    topics: topics,
    sentiment_analysis_results: sentiment_analysis_results,
    speakers_expected: speakers_expected,
    language_model: language_model,
    utterances: utterances,
    entities: entities,
    filter_profanity: filter_profanity,
    audio_end_at: audio_end_at,
    dual_channel: dual_channel,
    speaker_labels: speaker_labels,
    throttled: throttled,
    audio_channels: audio_channels,
    content_safety: content_safety,
    punctuate: punctuate,
    auto_chapters: auto_chapters,
    format_text: format_text,
    language_code: language_code,
    auto_highlights: auto_highlights,
    webhook_url: webhook_url,
  ))
}

pub fn transcript_encode(data: Transcript) {
  utils.object([
    #("language_detection", json.nullable(data.language_detection, json.bool)),
    #("disfluencies", json.nullable(data.disfluencies, json.bool)),
    #("audio_duration", json.nullable(data.audio_duration, json.int)),
    #(
      "language_confidence_threshold",
      json.nullable(data.language_confidence_threshold, json.float),
    ),
    #(
      "redact_pii_policies",
      json.nullable(data.redact_pii_policies, json.array(_, pii_policy_encode)),
    ),
    #(
      "keyterms_prompt",
      json.nullable(data.keyterms_prompt, json.array(_, json.string)),
    ),
    #("id", json.string(data.id)),
    #(
      "redact_pii_sub",
      json.nullable(data.redact_pii_sub, substitution_policy_encode),
    ),
    #("summary_type", json.nullable(data.summary_type, json.string)),
    #("status", transcript_status_encode(data.status)),
    #("redact_pii", json.bool(data.redact_pii)),
    #("custom_topics", json.nullable(data.custom_topics, json.bool)),
    #("webhook_status_code", json.nullable(data.webhook_status_code, json.int)),
    #(
      "language_confidence",
      json.nullable(data.language_confidence, json.float),
    ),
    #("summarization", json.bool(data.summarization)),
    #("iab_categories", json.nullable(data.iab_categories, json.bool)),
    #("boost_param", json.nullable(data.boost_param, json.string)),
    #("webhook_auth", json.bool(data.webhook_auth)),
    #("audio_start_from", json.nullable(data.audio_start_from, json.int)),
    #("summary_model", json.nullable(data.summary_model, json.string)),
    #("word_boost", json.nullable(data.word_boost, json.array(_, json.string))),
    #(
      "webhook_auth_header_name",
      json.nullable(data.webhook_auth_header_name, json.string),
    ),
    #("speech_threshold", json.nullable(data.speech_threshold, json.float)),
    #(
      "auto_highlights_result",
      json.nullable(data.auto_highlights_result, utils.any_to_json),
    ),
    #("text", json.nullable(data.text, json.string)),
    #("acoustic_model", json.string(data.acoustic_model)),
    #("speech_model", utils.any_to_json(data.speech_model)),
    #("sentiment_analysis", json.nullable(data.sentiment_analysis, json.bool)),
    #("speed_boost", json.nullable(data.speed_boost, json.bool)),
    #(
      "iab_categories_result",
      json.nullable(data.iab_categories_result, utils.any_to_json),
    ),
    #("confidence", json.nullable(data.confidence, json.float)),
    #("multichannel", json.nullable(data.multichannel, json.bool)),
    #(
      "redact_pii_audio_quality",
      json.nullable(data.redact_pii_audio_quality, utils.any_to_json),
    ),
    #("words", json.nullable(data.words, json.array(_, transcript_word_encode))),
    #("entity_detection", json.nullable(data.entity_detection, json.bool)),
    #("redact_pii_audio", json.nullable(data.redact_pii_audio, json.bool)),
    #(
      "custom_spelling",
      json.nullable(data.custom_spelling, json.array(
        _,
        transcript_custom_spelling_encode,
      )),
    ),
    #("error", json.nullable(data.error, json.string)),
    #("summary", json.nullable(data.summary, json.string)),
    #("chapters", json.nullable(data.chapters, json.array(_, chapter_encode))),
    #("audio_url", json.string(data.audio_url)),
    #(
      "content_safety_labels",
      json.nullable(data.content_safety_labels, utils.any_to_json),
    ),
    #("prompt", json.nullable(data.prompt, json.string)),
    #("topics", json.nullable(data.topics, json.array(_, json.string))),
    #(
      "sentiment_analysis_results",
      json.nullable(data.sentiment_analysis_results, json.array(
        _,
        sentiment_analysis_result_encode,
      )),
    ),
    #("speakers_expected", json.nullable(data.speakers_expected, json.int)),
    #("language_model", json.string(data.language_model)),
    #(
      "utterances",
      json.nullable(data.utterances, json.array(_, transcript_utterance_encode)),
    ),
    #("entities", json.nullable(data.entities, json.array(_, entity_encode))),
    #("filter_profanity", json.nullable(data.filter_profanity, json.bool)),
    #("audio_end_at", json.nullable(data.audio_end_at, json.int)),
    #("dual_channel", json.nullable(data.dual_channel, json.bool)),
    #("speaker_labels", json.nullable(data.speaker_labels, json.bool)),
    #("throttled", json.nullable(data.throttled, json.bool)),
    #("audio_channels", json.nullable(data.audio_channels, json.int)),
    #("content_safety", json.nullable(data.content_safety, json.bool)),
    #("punctuate", json.nullable(data.punctuate, json.bool)),
    #("auto_chapters", json.nullable(data.auto_chapters, json.bool)),
    #("format_text", json.nullable(data.format_text, json.bool)),
    #("language_code", json.nullable(data.language_code, utils.any_to_json)),
    #("auto_highlights", json.bool(data.auto_highlights)),
    #("webhook_url", json.nullable(data.webhook_url, json.string)),
  ])
}

pub fn lemur_question_decoder() {
  use answer_options <- decode.optional_field(
    "answer_options",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use answer_format <- decode.optional_field(
    "answer_format",
    None,
    decode.optional(decode.string),
  )
  use context <- decode.optional_field(
    "context",
    None,
    decode.optional(utils.any_decoder()),
  )
  use question <- decode.field("question", decode.string)
  decode.success(LemurQuestion(
    answer_options: answer_options,
    answer_format: answer_format,
    context: context,
    question: question,
  ))
}

pub fn lemur_question_encode(data: LemurQuestion) {
  utils.object([
    #(
      "answer_options",
      json.nullable(data.answer_options, json.array(_, json.string)),
    ),
    #("answer_format", json.nullable(data.answer_format, json.string)),
    #("context", json.nullable(data.context, utils.any_to_json)),
    #("question", json.string(data.question)),
  ])
}

pub fn lemur_task_response_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_task_response_encode(_data: LemurTaskResponse) {
  json.null()
}

pub fn redacted_audio_response_decoder() {
  use status <- decode.field("status", redacted_audio_status_decoder())
  use redacted_audio_url <- decode.field("redacted_audio_url", decode.string)
  decode.success(RedactedAudioResponse(
    status: status,
    redacted_audio_url: redacted_audio_url,
  ))
}

pub fn redacted_audio_response_encode(data: RedactedAudioResponse) {
  utils.object([
    #("status", redacted_audio_status_encode(data.status)),
    #("redacted_audio_url", json.string(data.redacted_audio_url)),
  ])
}

pub fn transcript_ready_notification_decoder() {
  use status <- decode.field("status", transcript_ready_status_decoder())
  use transcript_id <- decode.field("transcript_id", decode.string)
  decode.success(TranscriptReadyNotification(
    status: status,
    transcript_id: transcript_id,
  ))
}

pub fn transcript_ready_notification_encode(data: TranscriptReadyNotification) {
  utils.object([
    #("status", transcript_ready_status_encode(data.status)),
    #("transcript_id", json.string(data.transcript_id)),
  ])
}

pub fn redact_pii_audio_quality_decoder() {
  decode.string
}

pub fn redact_pii_audio_quality_encode(data: RedactPiiAudioQuality) {
  json.string(data)
}

pub fn lemur_model_decoder() {
  decode.string
}

pub fn lemur_model_encode(data: LemurModel) {
  json.string(data)
}

pub fn transcript_paragraph_decoder() {
  use end <- decode.field("end", decode.int)
  use text <- decode.field("text", decode.string)
  use confidence <- decode.field("confidence", decode.float)
  use words <- decode.field("words", decode.list(transcript_word_decoder()))
  use start <- decode.field("start", decode.int)
  decode.success(TranscriptParagraph(
    end: end,
    text: text,
    confidence: confidence,
    words: words,
    start: start,
  ))
}

pub fn transcript_paragraph_encode(data: TranscriptParagraph) {
  utils.object([
    #("end", json.int(data.end)),
    #("text", json.string(data.text)),
    #("confidence", json.float(data.confidence)),
    #("words", json.array(_, transcript_word_encode)(data.words)),
    #("start", json.int(data.start)),
  ])
}

pub fn list_transcript_params_decoder() {
  use limit <- decode.optional_field("limit", None, decode.optional(decode.int))
  use before_id <- decode.optional_field(
    "before_id",
    None,
    decode.optional(decode.string),
  )
  use after_id <- decode.optional_field(
    "after_id",
    None,
    decode.optional(decode.string),
  )
  use created_on <- decode.optional_field(
    "created_on",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(transcript_status_decoder()),
  )
  use throttled_only <- decode.optional_field(
    "throttled_only",
    None,
    decode.optional(decode.bool),
  )
  decode.success(ListTranscriptParams(
    limit: limit,
    before_id: before_id,
    after_id: after_id,
    created_on: created_on,
    status: status,
    throttled_only: throttled_only,
  ))
}

pub fn list_transcript_params_encode(data: ListTranscriptParams) {
  utils.object([
    #("limit", json.nullable(data.limit, json.int)),
    #("before_id", json.nullable(data.before_id, json.string)),
    #("after_id", json.nullable(data.after_id, json.string)),
    #("created_on", json.nullable(data.created_on, json.string)),
    #("status", json.nullable(data.status, transcript_status_encode)),
    #("throttled_only", json.nullable(data.throttled_only, json.bool)),
  ])
}

pub fn lemur_action_items_response_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_action_items_response_encode(_data: LemurActionItemsResponse) {
  json.null()
}

pub fn transcript_language_code_decoder() {
  decode.string
}

pub fn transcript_language_code_encode(data: TranscriptLanguageCode) {
  json.string(data)
}

pub fn lemur_summary_params_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_summary_params_encode(_data: LemurSummaryParams) {
  json.null()
}

pub fn transcript_utterance_decoder() {
  use speaker <- decode.field("speaker", decode.string)
  use end <- decode.field("end", decode.int)
  use text <- decode.field("text", decode.string)
  use confidence <- decode.field("confidence", decode.float)
  use words <- decode.field("words", decode.list(transcript_word_decoder()))
  use channel <- decode.optional_field(
    "channel",
    None,
    decode.optional(decode.string),
  )
  use start <- decode.field("start", decode.int)
  decode.success(TranscriptUtterance(
    speaker: speaker,
    end: end,
    text: text,
    confidence: confidence,
    words: words,
    channel: channel,
    start: start,
  ))
}

pub fn transcript_utterance_encode(data: TranscriptUtterance) {
  utils.object([
    #("speaker", json.string(data.speaker)),
    #("end", json.int(data.end)),
    #("text", json.string(data.text)),
    #("confidence", json.float(data.confidence)),
    #("words", json.array(_, transcript_word_encode)(data.words)),
    #("channel", json.nullable(data.channel, json.string)),
    #("start", json.int(data.start)),
  ])
}

pub fn lemur_question_answer_params_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_question_answer_params_encode(_data: LemurQuestionAnswerParams) {
  json.null()
}

pub fn uploaded_file_decoder() {
  use upload_url <- decode.field("upload_url", decode.string)
  decode.success(UploadedFile(upload_url: upload_url))
}

pub fn uploaded_file_encode(data: UploadedFile) {
  utils.object([#("upload_url", json.string(data.upload_url))])
}

pub fn transcript_params_decoder() {
  decode.dict(
    decode.string,
    decode.new_primitive_decoder("Never", fn(_) {
      panic as "tried to decode a never decode value"
    }),
  )
}

pub fn transcript_params_encode(data: TranscriptParams) {
  utils.dict(data, fn(_data) { panic as "never value cannot be encoded" })
}

pub fn lemur_task_params_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_task_params_encode(_data: LemurTaskParams) {
  json.null()
}

pub fn transcript_optional_params_decoder() {
  use language_detection <- decode.optional_field(
    "language_detection",
    None,
    decode.optional(decode.bool),
  )
  use disfluencies <- decode.optional_field(
    "disfluencies",
    None,
    decode.optional(decode.bool),
  )
  use language_confidence_threshold <- decode.optional_field(
    "language_confidence_threshold",
    None,
    decode.optional(decode.float),
  )
  use redact_pii_policies <- decode.optional_field(
    "redact_pii_policies",
    None,
    decode.optional(decode.list(pii_policy_decoder())),
  )
  use redact_pii_sub <- decode.optional_field(
    "redact_pii_sub",
    None,
    decode.optional(utils.any_decoder()),
  )
  use summary_type <- decode.optional_field(
    "summary_type",
    None,
    decode.optional(summary_type_decoder()),
  )
  use redact_pii <- decode.optional_field(
    "redact_pii",
    None,
    decode.optional(decode.bool),
  )
  use custom_topics <- decode.optional_field(
    "custom_topics",
    None,
    decode.optional(decode.bool),
  )
  use content_safety_confidence <- decode.optional_field(
    "content_safety_confidence",
    None,
    decode.optional(decode.int),
  )
  use iab_categories <- decode.optional_field(
    "iab_categories",
    None,
    decode.optional(decode.bool),
  )
  use summarization <- decode.optional_field(
    "summarization",
    None,
    decode.optional(decode.bool),
  )
  use boost_param <- decode.optional_field(
    "boost_param",
    None,
    decode.optional(transcript_boost_param_decoder()),
  )
  use audio_start_from <- decode.optional_field(
    "audio_start_from",
    None,
    decode.optional(decode.int),
  )
  use summary_model <- decode.optional_field(
    "summary_model",
    None,
    decode.optional(summary_model_decoder()),
  )
  use webhook_auth_header_value <- decode.optional_field(
    "webhook_auth_header_value",
    None,
    decode.optional(decode.string),
  )
  use word_boost <- decode.optional_field(
    "word_boost",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use webhook_auth_header_name <- decode.optional_field(
    "webhook_auth_header_name",
    None,
    decode.optional(decode.string),
  )
  use speech_threshold <- decode.optional_field(
    "speech_threshold",
    None,
    decode.optional(decode.float),
  )
  use speech_model <- decode.optional_field(
    "speech_model",
    None,
    decode.optional(utils.any_decoder()),
  )
  use sentiment_analysis <- decode.optional_field(
    "sentiment_analysis",
    None,
    decode.optional(decode.bool),
  )
  use redact_pii_audio_quality <- decode.optional_field(
    "redact_pii_audio_quality",
    None,
    decode.optional(redact_pii_audio_quality_decoder()),
  )
  use entity_detection <- decode.optional_field(
    "entity_detection",
    None,
    decode.optional(decode.bool),
  )
  use redact_pii_audio <- decode.optional_field(
    "redact_pii_audio",
    None,
    decode.optional(decode.bool),
  )
  use prompt <- decode.optional_field(
    "prompt",
    None,
    decode.optional(decode.string),
  )
  use topics <- decode.optional_field(
    "topics",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use audio_end_at <- decode.optional_field(
    "audio_end_at",
    None,
    decode.optional(decode.int),
  )
  use dual_channel <- decode.optional_field(
    "dual_channel",
    None,
    decode.optional(decode.bool),
  )
  use speaker_labels <- decode.optional_field(
    "speaker_labels",
    None,
    decode.optional(decode.bool),
  )
  use keyterms_prompt <- decode.optional_field(
    "keyterms_prompt",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use content_safety <- decode.optional_field(
    "content_safety",
    None,
    decode.optional(decode.bool),
  )
  use punctuate <- decode.optional_field(
    "punctuate",
    None,
    decode.optional(decode.bool),
  )
  use auto_chapters <- decode.optional_field(
    "auto_chapters",
    None,
    decode.optional(decode.bool),
  )
  use format_text <- decode.optional_field(
    "format_text",
    None,
    decode.optional(decode.bool),
  )
  use language_code <- decode.optional_field(
    "language_code",
    None,
    decode.optional(utils.any_decoder()),
  )
  use auto_highlights <- decode.optional_field(
    "auto_highlights",
    None,
    decode.optional(decode.bool),
  )
  use multichannel <- decode.optional_field(
    "multichannel",
    None,
    decode.optional(decode.bool),
  )
  use custom_spelling <- decode.optional_field(
    "custom_spelling",
    None,
    decode.optional(decode.list(transcript_custom_spelling_decoder())),
  )
  use webhook_url <- decode.optional_field(
    "webhook_url",
    None,
    decode.optional(decode.string),
  )
  use speakers_expected <- decode.optional_field(
    "speakers_expected",
    None,
    decode.optional(decode.int),
  )
  use filter_profanity <- decode.optional_field(
    "filter_profanity",
    None,
    decode.optional(decode.bool),
  )
  decode.success(TranscriptOptionalParams(
    language_detection: language_detection,
    disfluencies: disfluencies,
    language_confidence_threshold: language_confidence_threshold,
    redact_pii_policies: redact_pii_policies,
    redact_pii_sub: redact_pii_sub,
    summary_type: summary_type,
    redact_pii: redact_pii,
    custom_topics: custom_topics,
    content_safety_confidence: content_safety_confidence,
    iab_categories: iab_categories,
    summarization: summarization,
    boost_param: boost_param,
    audio_start_from: audio_start_from,
    summary_model: summary_model,
    webhook_auth_header_value: webhook_auth_header_value,
    word_boost: word_boost,
    webhook_auth_header_name: webhook_auth_header_name,
    speech_threshold: speech_threshold,
    speech_model: speech_model,
    sentiment_analysis: sentiment_analysis,
    redact_pii_audio_quality: redact_pii_audio_quality,
    entity_detection: entity_detection,
    redact_pii_audio: redact_pii_audio,
    prompt: prompt,
    topics: topics,
    audio_end_at: audio_end_at,
    dual_channel: dual_channel,
    speaker_labels: speaker_labels,
    keyterms_prompt: keyterms_prompt,
    content_safety: content_safety,
    punctuate: punctuate,
    auto_chapters: auto_chapters,
    format_text: format_text,
    language_code: language_code,
    auto_highlights: auto_highlights,
    multichannel: multichannel,
    custom_spelling: custom_spelling,
    webhook_url: webhook_url,
    speakers_expected: speakers_expected,
    filter_profanity: filter_profanity,
  ))
}

pub fn transcript_optional_params_encode(data: TranscriptOptionalParams) {
  utils.object([
    #("language_detection", json.nullable(data.language_detection, json.bool)),
    #("disfluencies", json.nullable(data.disfluencies, json.bool)),
    #(
      "language_confidence_threshold",
      json.nullable(data.language_confidence_threshold, json.float),
    ),
    #(
      "redact_pii_policies",
      json.nullable(data.redact_pii_policies, json.array(_, pii_policy_encode)),
    ),
    #("redact_pii_sub", json.nullable(data.redact_pii_sub, utils.any_to_json)),
    #("summary_type", json.nullable(data.summary_type, summary_type_encode)),
    #("redact_pii", json.nullable(data.redact_pii, json.bool)),
    #("custom_topics", json.nullable(data.custom_topics, json.bool)),
    #(
      "content_safety_confidence",
      json.nullable(data.content_safety_confidence, json.int),
    ),
    #("iab_categories", json.nullable(data.iab_categories, json.bool)),
    #("summarization", json.nullable(data.summarization, json.bool)),
    #(
      "boost_param",
      json.nullable(data.boost_param, transcript_boost_param_encode),
    ),
    #("audio_start_from", json.nullable(data.audio_start_from, json.int)),
    #("summary_model", json.nullable(data.summary_model, summary_model_encode)),
    #(
      "webhook_auth_header_value",
      json.nullable(data.webhook_auth_header_value, json.string),
    ),
    #("word_boost", json.nullable(data.word_boost, json.array(_, json.string))),
    #(
      "webhook_auth_header_name",
      json.nullable(data.webhook_auth_header_name, json.string),
    ),
    #("speech_threshold", json.nullable(data.speech_threshold, json.float)),
    #("speech_model", json.nullable(data.speech_model, utils.any_to_json)),
    #("sentiment_analysis", json.nullable(data.sentiment_analysis, json.bool)),
    #(
      "redact_pii_audio_quality",
      json.nullable(
        data.redact_pii_audio_quality,
        redact_pii_audio_quality_encode,
      ),
    ),
    #("entity_detection", json.nullable(data.entity_detection, json.bool)),
    #("redact_pii_audio", json.nullable(data.redact_pii_audio, json.bool)),
    #("prompt", json.nullable(data.prompt, json.string)),
    #("topics", json.nullable(data.topics, json.array(_, json.string))),
    #("audio_end_at", json.nullable(data.audio_end_at, json.int)),
    #("dual_channel", json.nullable(data.dual_channel, json.bool)),
    #("speaker_labels", json.nullable(data.speaker_labels, json.bool)),
    #(
      "keyterms_prompt",
      json.nullable(data.keyterms_prompt, json.array(_, json.string)),
    ),
    #("content_safety", json.nullable(data.content_safety, json.bool)),
    #("punctuate", json.nullable(data.punctuate, json.bool)),
    #("auto_chapters", json.nullable(data.auto_chapters, json.bool)),
    #("format_text", json.nullable(data.format_text, json.bool)),
    #("language_code", json.nullable(data.language_code, utils.any_to_json)),
    #("auto_highlights", json.nullable(data.auto_highlights, json.bool)),
    #("multichannel", json.nullable(data.multichannel, json.bool)),
    #(
      "custom_spelling",
      json.nullable(data.custom_spelling, json.array(
        _,
        transcript_custom_spelling_encode,
      )),
    ),
    #("webhook_url", json.nullable(data.webhook_url, json.string)),
    #("speakers_expected", json.nullable(data.speakers_expected, json.int)),
    #("filter_profanity", json.nullable(data.filter_profanity, json.bool)),
  ])
}

pub fn transcript_ready_status_decoder() {
  decode.string
}

pub fn transcript_ready_status_encode(data: TranscriptReadyStatus) {
  json.string(data)
}

pub fn lemur_action_items_params_decoder() {
  decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })
}

pub fn lemur_action_items_params_encode(_data: LemurActionItemsParams) {
  json.null()
}
